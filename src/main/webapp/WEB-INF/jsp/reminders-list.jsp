<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>
<html lang="en">

<jsp:include page="include/header.jsp" />

<body>
	<jsp:include page="include/navbar.jsp" />

	<div class="container main">
		<h1>Reminders</h1>

		<form action="/reminders/reminder" method="post"
			name="reminderDetails" id="reminderDetails">
			<input type="hidden" name="reminderId" value="" id="reminderId" />
		</form>

		<div class="list-group">
			<c:forEach items="${reminders}" var="reminder" varStatus="rowCounter">
				<table style="width: 100%; margin-bottom: 10px;">
					<tr>
						<td><a href="#" id="reminderDetails${rowCounter.count}"
							class="list-group-item">
								<h4 class="list-group-item-heading">${reminder.name}</h4> <span
								class="badge">${reminder.datetime}</span>
								<p class="list-group-item-text">${reminder.description}</p>
						</a> <tag:formSubmit sourceId="reminderDetails${rowCounter.count}"
								event="click" formId="reminderDetails"
								beforeSubmit="jQuery('${'#'}reminderId').val('${reminder.id}');" />
						</td>
						<td style="width: 10px;">
							<div data-toggle="buttons" style="margin-left: 5px;">
								<label class="btn btn-default"> <input
									id="${reminder.id}" type="checkbox" autocomplete="off">
									<span class="glyphicon glyphicon-ok"></span>
								</label>
							</div>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>

		<a id="addButton" type="button" class="btn btn-default btn-success"
			style="float: left; margin-left: 10%;" href="/reminders/new-reminder">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add
			new reminder
		</a>
		<button id="removeButton" type="button"
			class="btn btn-default btn-danger disabled"
			style="float: right; margin-right: 10%;">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
			Remove reminder(s)
		</button>

		<div id="removeModal" class="modal fade">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Remove reminder(s)</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>
							Are you sure that you want to remove the selected reminder(s)?
						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="removeLists();">Remove</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Dismiss</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>

<jsp:include page="include/footer.jsp" />

<script type="text/javascript">
	var listIds = [];

	function removeLists() {
		$.ajax({
			type : "POST",
			url : "/reminders/remove-reminders",
			data : {
				listIds : listIds
			},
			success : function(result) {
				$('#removeModal').modal('hide');
				location.reload();
			},
			error : function(result) {
				$('#removeModal').modal('hide')
			}
		});
	};
	$(function() {
		$('input:checkbox').change(
				function() {
					if ($(this).is(':checked')) {
						listIds.push($(this).attr('id'));
					} else {
						var index = listIds.indexOf($(this).attr('id'));
						if (index > -1) {
							listIds.splice(index, 1);
						}
					}
					console.log(listIds);

					if ($("[type=checkbox]:checked").length) {
						document.getElementById('removeButton').classList
								.remove('disabled');
						document.getElementById('removeButton').setAttribute(
								"data-toggle", "modal");
						document.getElementById('removeButton').setAttribute(
								"data-target", "#removeModal");
					} else {
						document.getElementById('removeButton').classList
								.add('disabled');
						document.getElementById('removeButton')
								.removeAttribute("data-toggle");
						document.getElementById('removeButton')
								.removeAttribute("data-target");
					}
				})
	});
</script>

</html>