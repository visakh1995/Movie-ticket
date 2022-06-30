</body>

<script src="../assets/js/jquery.min.js"></script> 
<script src="../assets/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
    crossorigin="anonymous">
</script>
<script>
    $(document).ready( function () {
      $('#table_id').DataTable();
    } );
</script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="../assets/js/custom.js"></script> 
<script>
      var hamburger = document.querySelector(".hamburger");
        hamburger.addEventListener("click", function(){
        document.querySelector("body").classList.toggle("active");
    })
</script>
</html>