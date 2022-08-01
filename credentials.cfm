Razor pay 

credentials
visakh.vs@techversantinfo.com 
techrazor@41







post
https://api.razorpay.com/v1/orders
basic auth
username password
key id : rzp_test_q14UWXJrpEpdwq
ps wd : HlE0V2iE8L3Y7JCjUaxwntHe

{
    "amount": 500,
    "currency": "INR",
    "receipt": "receipt_1101",
    "partial_payment": true,
    "first_payment_min_amount": 230
}

results

{
    "id": "order_K0Ny49NyGbcIoc",
    "entity": "order",
    "amount": 500,
    "amount_paid": 0,
    "amount_due": 500,
    "currency": "INR",
    "receipt": "receipt_1101",
    "offer_id": null,
    "status": "created",
    "attempts": 0,
    "notes": [],
    "created_at": 1659360539
}

pass response unique order id from api into checkout page to generate gateway

then ticket generation