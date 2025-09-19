<style>
    #order-field{
        height:54em;
        overflow:auto;
    }
    .order-list{
        height:18em;
        overflow:auto;
        position:relative;
    }
    .order-list-header{
        position:sticky;
        top:0;
        z-index:2 !important;
    }
    .order-body{
        position:relative;
        z-index:1 !important;
    }
    #order-field:empty{
        display:flex;
        align-items:center;
        justify-content:center;
    }
    #order-field:empty:after{
        content:"No order has been queued yet.";
        color: #b7b4b4;
        font-size: 1.7em;
        font-style: italic;
    }
</style>
<div class="content bg-gradient-warning py-3 px-4">
    <h3 class="font-weight-bolder text-light">Order List (Kitchen Side)</h3>
</div>
<div class="row mt-n4 justify-content-center">
    <div class="col-lg-11 col-md-11 col-sm-12 col-xs-12">
        <div class="card rounded-0">
            <div class="card-body">
                <div id="order-field" class="row row-cols-lg-3 rol-cols-md-2 row-cols-sm-1 gx-2 py-1"></div>
            </div>
        </div>
    </div>
</div>
<noscript id="order-clone">
<div class="col order-item">
    <div class="card rounded-0 shadow card-outline card-warning">
        <div class="card-header py-1">
            <div class="card-title"><b>Queue Code: 10001</b></div>
        </div>
        <div class="card-body">
            <div class="order-list">
                <div class="d-flex w-100 order-list-header bg-gradient-warning">
                    <div class="col-9 m-0 border"><b>Product</b></div>
                    <div class="col-3 m-0 border text-center">QTY</div>
                </div>
                <div class="order-body">
                </div>
            </div>
        </div>
        <div class="card-footer py-1 text-center">
                <button class="btn btn-sm btn-light bg-gradient-light border order-served px-2 btn-block rounded-pill" type="button" data-id="">Serve</button>
        </div>
    </div>
</div>
</noscript>
<script>
    var isLoading = false;
    var currentOrders = new Set();
    var pollingInterval = null;

    function get_order(){
        // Prevent multiple simultaneous requests
        if(isLoading) return;
        
        isLoading = true;
        listed = []
        $('.order-item').each(function(){
            listed.push($(this).attr('data-id'))
        })
        
        $.ajax({
            url:_base_url_+"classes/Master.php?f=get_order",
            method:'POST',
            data:{listed : listed},
            dataType:'json',
            timeout: 10000, // 10 second timeout
            error:err=>{
                console.log(err)
                alert_toast("An error occurred", "error")
                isLoading = false;
            },
            success:function(resp){
                isLoading = false;
                if(resp.status == 'success'){
                    // Track new orders to prevent duplicates
                    var newOrderIds = Object.keys(resp.data).map(k => resp.data[k].id);
                    
                    Object.keys(resp.data).map(k=>{
                        var data = resp.data[k]
                        
                        // Only add if order doesn't already exist
                        if(!currentOrders.has(data.id) && !$('.order-item[data-id="'+data.id+'"]').length){
                            currentOrders.add(data.id);
                            
                            var card = $($('noscript#order-clone').html()).clone()
                            card.attr('data-id',data.id)
                            card.addClass('order-item') // Ensure class is added
                            card.find('.card-title').text('Queue #' + data.queue)
                            
                            Object.keys(data.item_arr).map(i=>{
                                var row = card.find('.order-list-header').clone().removeClass('order-list-header bg-gradient-warning')
                                row.find('div').first().text(data.item_arr[i].item)
                                row.find('div').last().text(parseInt(data.item_arr[i].quantity).toLocaleString())
                                card.find('.order-body').append(row)
                            })
                            
                            $('#order-field').append(card)
                            
                            // Use event delegation to prevent multiple event handlers
                            card.find('.order-served').off('click').on('click', function(){
                                _conf("Are you sure to serve <b>Queue #: "+data.queue+"</b>?",'serve_order', [data.id])
                            })
                        }
                    })
                }
            }
        })
    }
    
    function startPolling(){
        if(pollingInterval) {
            clearInterval(pollingInterval);
        }
        pollingInterval = setInterval(() => {
            get_order()
        }, 3000); // Increased to 3 seconds to reduce server load
    }
    
    function stopPolling(){
        if(pollingInterval) {
            clearInterval(pollingInterval);
            pollingInterval = null;
        }
    }
    
    $(function(){
        $('body').addClass('sidebar-collapse')
        
        // Initial load
        get_order();
        
        // Start polling
        startPolling();
        
        // Stop polling when page is about to unload
        $(window).on('beforeunload', function(){
            stopPolling();
        });
        
        // Pause polling when tab is not visible
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) {
                stopPolling();
            } else {
                startPolling();
            }
        });
    })
    
    function serve_order($id){
        start_loader();
        
        // Remove from tracking set
        currentOrders.delete($id);
        
		$.ajax({
			url:_base_url_+"classes/Master.php?f=serve_order",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
                    $('.modal').modal('hide')
					alert_toast("Order has been served.",'success');
					$('.order-item[data-id="'+$id+'"]').remove()
				}else{
					alert_toast("An error occured.",'error');
					// Re-add to tracking if removal failed
					currentOrders.add($id);
				}
					end_loader();
			}
		})
    }
</script>
