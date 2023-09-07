<div class="modal fade" id="cart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Your Cart</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="cart-body">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button onclick="window.location.href = 'checkout.jsp';" type="button" class="btn checkout-btn btn-primary">CHECKOUT</button>
            </div>
        </div>
    </div>
</div>

<div id="myToast" style="background-color:#C1B4AEAA!important" class="toast snowy-card bg-transparent rounded-pill me-3 mb-3 position-fixed z-2 bottom-0 end-0" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header bg-transparent rounded-pill px-2 mx-3 mt-1">
        <img src="Images\logos\like.png" class="mx-2" alt="..." width="20" height="20">
        <strong class="me-auto">Message</strong>
        <small class="text-body-secondary">Just Now</small>
        <button type="button" class="btn-close px-2" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body fs-6 text-center fw-bold">
        Hello, world! This is a toast message.
    </div>
</div>