<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


	<div class="clearfix"></div>
	<ol class="breadcrumb">
		<li><a href="#">Home</a></li>
	    <li>Truck</li>
	</ol>
	<div class="clearfix"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 col-sm-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Add Truck</h4>
						<div class="options"></div>
                    </div>
					<form:form modelAttribute="truckForm" class="form-horizontal" action="addTruck">
					<div class="panel-body">
						<c:if test="${not empty msg}">
							<div class="row">
	                    		<div class="col-sm-4 col-sm-offset-4">
	                    			<div class="form-group">
	                    				<div class="msgcss alert alert-${cssMsg} fadeIn animated" style="text-align: center;">${msg}</div>
	                    			</div>
	                    		</div>
	                    	</div>
                    	</c:if>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Truck Number <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:hidden path="id" />
										<form:input path="trucknumber" type="text" class="form-control validate" placeholder="Truck Number"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Registration Expiry <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="registrationexpirydate1" type="text" readonly="true" class="form-control" placeholder="Registration Expiry"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Civil Defense Card Expiry <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="civildefensecardexpirydate1" type="text" readonly="true" class="form-control" placeholder="Civil Defense Card Expiry"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Service Due <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="servicedue1" type="text" class="form-control" readonly="true" placeholder="Servicedue"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Make <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="make" type="text" class="form-control validate" placeholder="Make"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Description <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="description" type="text" class="form-control validate" placeholder="Description"/>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Capacity of Truck <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:input path="capacityoftruck" type="text" class="form-control validate numericOnly" placeholder="Capacity of Truck"/>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">LPO Number <span class="impColor">*</span></label>
									<div class="col-md-6">
<%-- 										<form:input path="lponumber" type="text" class="form-control validate" placeholder="LPO Number "/> --%>
										<form:select path="lponumber" value="" class="form-control  validate"  onchange="removeBorder(this.id),getLPOdetails(this.value)" >
								    	<form:option value="">-- Select LPO Number --</form:option>
								    	<form:options items="${LPONumbers }"></form:options> 
								    	</form:select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="focusedinput" class="col-md-4 control-label">Type Of Service <span class="impColor">*</span></label>
									<div class="col-md-6">
										<form:select path="typeOfService" class="form-control  chzn-select validate" onchange="removeBorder(this.id)">
									      	<form:option value="">-- Select Type Of Service --</form:option>
									  		<form:option value="Maintenance">Maintenance</form:option>
									  		<form:option value="Agency Repairs">Agency Repairs</form:option>
									  		<form:option value="Agency Service">Agency Service</form:option>
									  	</form:select>
									</div>
								</div>
							</div>
						</div>
                    </div>
                    <div class="panel-footer">
						<div class="row">
							<div class="col-sm-12">
				      			<div class="btn-toolbar pull-right">
									<input class="btn-primary btn" type="submit" value="Sumbit" id="submit1">
					      			<input class="btn-default btn cancel" type="reset" value="Cancel">
				      			</div>
				      		</div>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
        <div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Truck List</h4>
						<div class="options">   
							<a href="javascript:;" class="panel-collapse"><i class="fa fa-chevron-down"></i></a>
						</div>
					</div>
					<div class="panel-body collapse in">
						<div class="table-responsive" id="tableId">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered datatables" id="example">
								<thead>
									<tr>
										<th>Truck Number</th><th>Registration Expiry</th><th>Civil Defense Card Expiry</th><th>Service Due</th><th>Make</th><th>Description</th><th>Capacity of Truck</th><th>LPO Number</th><th>Truck Status</th><th></th>
									</tr>
								</thead>
								<tbody> </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- container -->

<script type='text/javascript' src='${baseurl }/js/jquery-ui.min.js'></script> 
<!--  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
<%-- <script type='text/javascript' src='${baseurl }/js/custemValidation.js'></script>  --%>
<script type="text/javascript">
$(function () {
$("#registrationexpirydate1").datepicker({
 dateFormat: "dd-MM-yy",
 changeDate : true,
	changeMonth : true,
	changeYear : true,
});

$("#civildefensecardexpirydate1").datepicker({
	 dateFormat: "dd-MM-yy",
	 changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	
$("#servicedue1").datepicker({
	 dateFormat: "dd-MM-yy",
	 changeDate : true,
		changeMonth : true,
		changeYear : true,
	});
	

});


var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
			+ '<thead><tr><th>Truck Number</th><th>Registration Expiry</th><th>Civil Defense Card Expiry</th><th>Service Due</th><th>Make</th><th>Description</th><th>Capacity of Truck</th><th>LPO Number</th><th>Truck Status</th><th></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		if(orderObj.status == "1"){
			var deleterow = "<a class='deactive' onclick='deletetruckMaster("+ orderObj.id+ ",0)'><i class='fa fa-bell green'></i></a>"
			/* $("#truckStatus option" ).removeClass('active');
			$("#truckStatus option#"+orderObj.truckStatus).addClass('highlight'); */	
		}else{  
			var deleterow = "<a class='active' onclick='deletetruckMaster("+ orderObj.id+ ",1)'><i class='fa fa-bell-o red'></i></a>"
			/* $("#truckStatus option" ).removeClass('active');
			$("#truckStatus option"+orderObj.truckStatus).addClass('highlight'); */	
		}
					var edit = "<a class='edit' onclick='editTruckMaster("+ orderObj.id+ ")'><i class='fa fa-pencil green'></i></a>"
					serviceUnitArray[orderObj.id] = orderObj;
					var tblRow = "<tr >"
							+ "<td title='"+orderObj.trucknumber+"'>"+ orderObj.trucknumber + "</td>"
							+ "<td title='"+orderObj.registrationexpirydate1+"'>"+ orderObj.registrationexpirydate1 + "</td>"
							+ "<td title='"+orderObj.civildefensecardexpirydate1+"'>"+ orderObj.civildefensecardexpirydate1 + "</td>"
							+ "<td title='"+orderObj.servicedue1+"'>"+ orderObj.servicedue1 + "</td>"
							+ "<td title='"+orderObj.make+"'>"+ orderObj.make + "</td>"
							+ "<td title='"+orderObj.description+"'>"+ orderObj.description+ "</td>"
							+ "<td title='"+orderObj.capacityoftruck+"'>"+ orderObj.capacityoftruck + "</td>"
							+ "<td title='"+orderObj.lponumber+"'>"+ orderObj.lponumber + "</td>"
							+ "<td title='"+orderObj.truckStatus+"'>"+ orderObj.truckStatus + "</td>"
							
							+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
							+ "</tr >";
					$(tblRow).appendTo("#tableId table tbody");
				
	});
}

function editTruckMaster(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#trucknumber").val(serviceUnitArray[id].trucknumber);
	$("#registrationexpirydate1").val(serviceUnitArray[id].registrationexpirydate1);
	$("#civildefensecardexpirydate1").val(serviceUnitArray[id].civildefensecardexpirydate1);
	$("#servicedue1").val(serviceUnitArray[id].servicedue1);
	$("#make").val(serviceUnitArray[id].make);
	$("#description").val(serviceUnitArray[id].description);
	$("#capacityoftruck").val(serviceUnitArray[id].capacityoftruck);
	$("#lponumber").val(serviceUnitArray[id].lponumber);
	$("#typeOfService").val(serviceUnitArray[id].typeOfService);
	$("#typeOfService").trigger("chosen:updated")
	$("#submit1").val("Update");
	$(window).scrollTop($('#page-heading').offset().top);
	}
function deletetruckMaster(id,status){
	
	var checkstr=null;
	if(status == 0){
		 checkstr =  confirm('Are you sure you want to Deactivate this?');
	}else{
		 checkstr =  confirm('Are you sure you want to Activate this?');
	}
	
	if(checkstr == true){
	var formData = new FormData();
    formData.append('id', id);
    formData.append('status', status);
	$.fn.makeMultipartRequest('POST', 'deletetruckMaster', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		window.location.reload();
// 		var alldata = jsonobj.allOrders1;
// 		console.log(jsonobj.allOrders1);
// 		displayTable(alldata);
	});
	}
	
}
$("#pageName").text("Truck Master");
$(".truck").addClass("active"); 
</script>
