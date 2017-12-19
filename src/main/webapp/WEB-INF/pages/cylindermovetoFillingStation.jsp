  <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

	<div class="clearfix"></div>
	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
		<li>Cylinder Move to Filling Station</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-sm-12">
			</div>
		</div>
            
        <div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-6">
				        		<p><input type="checkbox" id="parent" style="cursor: pointer;"/> <label for="parent" style="cursor: pointer;">Check/Uncheck All</label></p>
							</div>
						</div>
					</div>
					
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
                    	<h4>Cylinders List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
						<div class="table-responsive" id="tableId">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
								<thead>
									<tr><th>Cylinder ID</th>
									<th>Store</th>
									<th>Size</th></tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<form:form commandName="fillingStationForm">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="focusedinput" class="col-md-3 control-label">Cylinders <span class="impColor">*</span></label>
							<div class="col-md-6">
				        		<div id="displayCylinders"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label for="focusedinput" class="col-md-3 control-label">Select Filling Station <span class="impColor">*</span></label>
							<div class="col-md-6">
				        		<form:select path="stationname" class="form-control validate" onfocus="removeBorder(this.id)">
				        			<form:option value="">-- Select Filling Station --</form:option>
				        			<form:options items="${fillingstation}"></form:options>
				        		</form:select>
							</div>
						</div>
					</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-offset-3 col-md-6" style="padding-top: 6px;">
				        		<input type="button" class="btn btn-primary" value="Move To Filling Station" onclick="movetofillingStation()">
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
				  	<div class="col-md-4">
						<div class="form-group">
							<label for="focusedinput" class="col-md-4 control-label">Store <span class="impColor">*</span></label>
							<div class="col-md-6">
				        		<form:select path="store" class="form-control validate" onfocus="removeBorder(this.id)">
				        			<form:option value="">-- Select Store --</form:option>
				        			<form:options items="${stores}"></form:options>
				        		</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="focusedinput" class="col-md-4 control-label">Quantity <span class="impColor">*</span></label>
							<div class="col-md-6">
				        		<form:input type="text" path="quantity" class="form-control validate" placeholder="quantity"/>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="focusedinput" class="col-md-4 control-label">Cylender Type <span class="impColor">*</span></label>
							<div class="col-md-6">
				        		<form:select path="cylinderType" class="form-control validate" onfocus="removeBorder(this.id)">
				        			<form:option value="">-- Select Store --</form:option>
				        			<form:options items="${cylinderTypes}"></form:options>
				        		</form:select>
							</div>
						</div>
					</div>
				</div>
				</form:form>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<div class="col-md-offset-3 col-md-6" style="padding-top: 6px;">
				        		<input type="button" class="btn btn-primary" value="search" onclick="searchData();">
<!-- 									<button class="btn btn-primary" >search</button> -->
							</div>
						</div>
					</div>
				</div>
         	</div>
		</div>
	</div> <!-- container -->

<script type="text/javascript">
$(document).ready(function() {
	  $("#parent").click(function() {
	    $(".child").prop("checked", this.checked);
	    var cylenderId = [];
        $('#tableId :checkbox:checked').each(function(i){
       	 cylenderId[i] = $(this).val();
        }); 
        $("#displayCylinders").text(cylenderId);
//         alert(cylenderId);
	    $('.child').click(function() {
	    	 var cylenderId = [];
	         $('#tableId :checkbox:checked').each(function(i){
	        	 cylenderId[i] = $(this).val();
	         }); 
	         $("#displayCylinders").text(cylenderId);
// 	         alert(cylenderId);
	        if ($('.child:checked').length == $('.child').length) {
	          $('#parent').prop('checked', true);
	        } else {
	          $('#parent').prop('checked', false);
	        }
	      });
	  });
});
/* var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
} */
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Cylinder ID</th><th>Store</th><th>Size</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
					serviceUnitArray[orderObj.id] = orderObj;
					var tblRow = "<tr >"
							+ "<td title='"+orderObj.cylinderid+"'><input class='child' name='chkbox' type='checkbox' style='width: 21px;' value='"+orderObj.cylinderid+"' >"+ orderObj.cylinderid + "</td>"
							+ "<td title='"+orderObj.strorername+"'>"+ orderObj.storename + "</td>"
							+ "<td title='"+orderObj.name+"'>"+ orderObj.name + "</td>"
							+ "</tr >";
					$(tblRow).appendTo("#tableId table tbody");
					
					 $('.child').click(function() {
				    	 var cylenderId = [];
				         $('#tableId :checkbox:checked').each(function(i){
				        	 cylenderId[i] = $(this).val();
				         }); 
				         $("#displayCylinders").text(cylenderId);
//			 	         alert(cylenderId);
				        if ($('.child:checked').length == $('.child').length) {
				          $('#parent').prop('checked', true);
				        } else {
				          $('#parent').prop('checked', false);
				        }
				      });
					});
	
	
}

function movetofillingStation(){
	 var cylenderId = [];
     $('#tableId :checkbox:checked').each(function(i){
    	 cylenderId[i] = $(this).val();
     }); 
     if(cylenderId.length == 0){
    	 alert("Please Select Cylinder");
    	 return false;
     }
     var stationname = $("#stationname").val();
     if(stationname == null || stationname == "undefined" || stationname ==""){
    	 alert("Please Select Filling Station");
    	 return false;
     }
     alert(cylenderId);
     var formData = new FormData();
     formData.append("fillingStation",stationname);
     formData.append("cylenderId",cylenderId);
     formData.append("cylinderStatus",2);
     $.fn.makeMultipartRequest('POST', 'updateCylinderStatus', false,
 			formData, false, 'text', function(data){
//  		var jsonobj = $.parseJSON(data);
 		window.location.reload();
 		/* alert(jsonobj.message);
 		var alldata = jsonobj.allOrders1;
 		console.log(jsonobj.allOrders1);
 		displayTable(alldata); */
 	});
     
}

function deleteCylinder(id){
	var checkstr =  confirm('Are you sure you want to delete this?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('id', id);
	$.fn.makeMultipartRequest('POST', 'deleteCylinder', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		alert(jsonobj.message);
		var alldata = jsonobj.allOrders1;
		console.log(jsonobj.allOrders1);
		displayTable(alldata);
	});
	}
	
}

function searchData(){
	var store=$("#store").val();
	var quantity=$("#quantity").val();
	var cylinderType=$("#cylinderType").val();
	 var formData = new FormData();
    
	
	$.ajax({
		type : "POST",
		url : "searchCylinderMoveToFilling.htm",
		data :"store="+store+"&quantity="+quantity+"&cylinderType="+cylinderType,
		 beforeSend : function() {
             $.blockUI({ message: 'Please wait' });
          },
		success: function (response) {
            	 $.unblockUI();
             if(response != null ){
            	 var resJson=JSON.parse(response);
            	 displayTable(resJson);
            	/*  $("#store").val("");
            	 $("#quantity").val("");
            	 $("#name").val(""); */
            	//alert("Delete Sucessfully");
            	//window.location.reload();
            	}
             //window.location.reload();
             },
         error: function (e) { 
        	 $.unblockUI();
				console.log(e);
         }
	});
	
    
     
}





</script>