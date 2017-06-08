<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<jsp:include page="include/header.jsp" />

<body>
	<jsp:include page="include/navbar.jsp" />

	<div class="container main">
		<h1>ADD REMINDER</h1>
		<form id="newReminderForm" class="form-horizontal new-list-form"
			data-toggle="validator" action="/reminders/new-reminder"
			method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">Name</label>
				<div class="col-sm-5">
					<input class="form-control" name="name" type="text" required
						placeholder="Enter reminder name here">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Description</label>
				<div class="col-sm-5">
					<textarea class="form-control" rows="5" name="description"
						placeholder="Enter reminder description here"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Enabled</label>
				<div class="col-sm-1">
					<input class="form-control" style="width: 30px; height: 30px;"
						name="enabled" type="checkbox" value="true">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">Datetime</label>
				<div class="col-sm-5">
					<input class="form-control" name="datetime" type="text" required
						pattern="^(\d{4})-(\d{2})-(\d{2}T(\d{2}:(\d{2})$" maxlength="16"
						title="YYYY-MM-DD HH:MM" placeholder="Enter date and time here">
				</div>
			</div>

			<button id="submitButton" type="submit" class="btn btn-success"
				style="float: left; margin-top: 20px;">Save</button>
			<a href="/reminders" class="btn btn-default"
				style="float: left; margin-top: 20px; margin-left: 20px;">Dismiss</a>
		</form>
	</div>
</body>

<jsp:include page="include/footer.jsp" />

<script type="text/javascript">
	$("textarea").focusout(function() {
		var defaultText = $(this).val();
		$(this).val(defaultText.trim());
	});
</script>

</html>