<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


		<div class="clearfix"></div>
		<ol class="breadcrumb">
			<li><a href="">Home</a></li>
			<li>Tariff Master</li>
		</ol>
		<div class="clearfix"></div>
		<div class="container">

			<div class="container">


				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h4>Tariff Master Details</h4>
								<div class="options"></div>
							</div>
							<form:form modelAttribute="tariffMaster" class="form-horizontal"
								role="form" id="education-form" action="saveTariffDetails"
								method="post">
								<div class="panel-body">
									<c:if test="${not empty msg}">
										<div class="form-group">
											<div class="col-sm-4 col-sm-offset-4">
												<div class="msgcss alert alert-${cssMsg} fadeIn animated"
													style="text-align: center;">${msg}</div>
											</div>
										</div>
									</c:if>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<form:hidden path="id" />
												<label class="col-sm-4 control-label required">Asset
													Code <span class="impColor">*</span>(Either Cylinder Code or Accessory Code)</label>
												<div class="col-sm-6">
													<form:input path="assetcode"
														class="form-control numericOnly validate"
														autocomplete="off" placeholder="Asset Code"
														required="required" />
													<span class="hasError" id="assetcodeError"></span>
													<div>
														<form:errors path="assetcode" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Asset
													Description <span class="impColor">*</span>
												</label>
												<div class="col-sm-6">
													<form:input path="assetdescription"
														class="form-control onlyCharacters validate"
														autocomplete="off" placeholder="Asset Description" required="required" />
													<span class="hasError" id="assetdescriptionError"></span>
													<div>
														<form:errors path="assetdescription" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Rate<span class="impColor">*</span></label>
												<div class="col-sm-6">
													<form:input path="rate"
														class="form-control numericOnly validate"
														autocomplete="off" placeholder="Rate" required="required" />
													<span class="hasError" id="rateError"></span>
													<div>
														<form:errors path="Rate" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Allowed Discount
													<span class="impColor">*</span>
												</label>
												<div class="col-sm-4">
													<div class="input-group">
												      <form:input path="alloweddiscount"
															class="form-control numericOnly validate"
															autocomplete="off" placeholder="Allowed Discount" required="required" />
												      <span class="input-group-addon"><i class="fa fa-percent"></i>
</span>   
												    </div>
													<span class="hasError" id="alloweddiscountError"></span>
													<div>
														<form:errors path="alloweddiscount" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="col-sm-4 control-label required">Remarks</label>
												<div class="col-sm-6">
													<form:input path="remarks"
														class="form-control onlyCharacters validate"
														autocomplete="off" placeholder="Remarks" required="required" />
													<span class="hasError" id="remarksError"></span>
													<div>
														<form:errors path="remarks" cssClass="error" />
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-12">
											<div class="btn-toolbar  pull-right">
												<input type="submit" value="Submit" id="submit1" class="btn-primary btn" />
												<input type="reset" value="Reset" class="btn-danger btn cancel" />
											</div>
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h4>Tariff Master Details</h4>
									<div class="options">
										<a href="javascript:;" class="panel-collapse"><i
											class="fa fa-chevron-down"></i></a>
									</div>
								</div>
								<div class="panel-body collapse in">
									<div class="table-responsive" id="tableId">
										<table cellpadding="0" cellspacing="0" border="0"
											class="table table-striped table-bordered datatables"
											id="example">
											<thead>
												<tr>
													<th>Asset Code</th>
													<th>Asset Description</th>
													<th>Rate</th>
													<th>Allowed Discount</th>
													<th>Remarks</th>
													<th>Status</th>
													<th></th>
												</tr>
											</thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


<script>
			var listOrders1 = ${allOrders1};
			if (listOrders1 != "") {
				displayTable(listOrders1);
			}
			function displayTable(listOrders) {
				$('#tableId').html('');
				var tableHead = '<table id="example" class="table table-striped table-bordered datatables">'
					+ '<thead><tr><th>Asset Code</th><th>Asset Description</th><th>Rate</th><th>Allowed Discount</th><th>Remarks</th><th>Status</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
			$('#tableId').html(tableHead);
				serviceUnitArray = {};
				$
						.each(
								listOrders,
								function(i, orderObj) {
									if(orderObj.status == "1"){
										var deleterow = "<a class='deactive' onclick='deleteTariffMasterDetails("+ orderObj.id+ ",0)'><i class='fa fa-bell green'></i></a>"
									}else{  
										var deleterow = "<a class='active' onclick='deleteTariffMasterDetails("+ orderObj.id+ ",1)'><i class='fa fa-bell-o red'></i></a>"
									}
									var edit = "<a class='edit' onclick='editTariffMasterDetails(" + orderObj.id + ")'><i class='fa fa-pencil green'></i></a>"
									serviceUnitArray[orderObj.id] = orderObj;
									var tblRow = "<tr >"
											+ "<td title='"+orderObj.id+"'>" + orderObj.assetcode + "</td>"
											+ "<td title='"+orderObj.id+"'>" + orderObj.assetdescription + "</td>"
											+ "<td title='"+orderObj.id+"'>" + orderObj.rate + "</td>"
											+ "<td title='"+orderObj.id+"'>" + orderObj.alloweddiscount + "</td>"
											+ "<td title='"+orderObj.id+"'>" + orderObj.remarks + "</td>"
											+ "<td title='"+orderObj.tariffStatus+"'>" + orderObj.tariffStatus + "</td>"
											+ "<td style='text-align: center;'>" + edit + "&nbsp;&nbsp;" + deleterow + "</td>" 
											+ "</tr >";
									$(tblRow).appendTo("#tableId table tbody");
								});
				$(".datatables").DataTable();

			}
			
			function editTariffMasterDetails(id) {
				$("#id").val(serviceUnitArray[id].id);
				$("#assetcode").val(serviceUnitArray[id].assetcode);
				$("#assetdescription").val(serviceUnitArray[id].assetdescription);
				$("#rate").val(serviceUnitArray[id].rate);
				$("#alloweddiscount").val(serviceUnitArray[id].alloweddiscount);
				$("#remarks").val(serviceUnitArray[id].remarks);
				$("#status").val(serviceUnitArray[id].status);
				//$("#customerid").val(serviceUnitArray[id].customerid);
				$("#submit1").val("Update");
				$(window).scrollTop($('body').offset().top);
			}
			function deleteTariffMasterDetails(id,status) {
				var checkstr=null;
				if(status == 0){
					 checkstr =  confirm('Are you sure you want to Deactivate this?');
				}else{
					 checkstr =  confirm('Are you sure you want to Activate this?');
				}
				var checkstr = confirm('Are you sure you want to delete this?');
				if (checkstr == true) {
					var formData = new FormData();
					formData.append('id', id);
					formData.append('status', status);
					$.fn.makeMultipartRequest('POST', 'deleteTariffMasterDetails',
							false, formData, false, 'text', function(data) {
								var jsonobj = $.parseJSON(data);
								var alldata = jsonobj.allOrders1;
								console.log(jsonobj.allOrders1);
								displayTable(alldata);
// 								window.location.reload();
							});
				}

			}
			$("#pageName").text("Tariff Master");
			$(".tariffMaster").addClass("active"); 
		</script>
<%-- <tr>
<td>  Religion System</td>
 <td> <form:select path ="religionSystem" items="${religionsSystemList}"/> </td>
</tr>
 --%>

</html>