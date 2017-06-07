<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <html lang="en">

            <jsp:include page="include/header.jsp" />

            <body>
                <jsp:include page="include/navbar.jsp" />

                <div class="container main">
                    <h1>To Do list</h1>
                    <div class="list-group">
                        <c:forEach items="${lists}" var="list">
                            <table style="width: 100%; margin-bottom: 10px;">
                                <tr>
                                    <td>
                                        <a href="#" class="list-group-item">
                                            <h4 class="list-group-item-heading">${list.name}</h4>
                                            <span class="badge">${fn:length(list.listItems)} items</span>
                                            <p class="list-group-item-text">Created on 10/10/2015</p>
                                        </a>
                                    </td>
                                    <td style="width: 10px;">
                                        <div data-toggle="buttons" style="margin-left: 5px;">
                                            <label class="btn btn-default">
                                                <input id="${list.name}" type="checkbox" autocomplete="off">
                                                <span class="glyphicon glyphicon-ok"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </c:forEach>
                    </div>

                    <a id="addButton" type="button" class="btn btn-default btn-success" style="float: left; margin-left: 10%;" href="/todo/new-list">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new list
                    </a>
                    <button id="removeButton" type="button" class="btn btn-default btn-danger disabled" style="float: right; margin-right: 10%;">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Remove list
                    </button>

                    <div id="removeModal" class="modal fade">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Remove</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Are you sure that you want to remove <i>list1</i>?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="removeLists();">Remove</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Dismiss</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            <jsp:include page="include/footer.jsp" />

            <script type="text/javascript">
                function removeLists() {
                    $.ajax({
                        type: "POST",
                        url: "/todo/remove-lists",
                        data: {
                            listIds: '1230'
                        },
                        success: function (result) {
                            console.log('success ui' + result);
                            $('#removeModal').modal('hide');
                            location.reload();
                        },
                        error: function (result) {
                            console.log('error ui');
                            $('#removeModal').modal('hide')
                        }
                    });
                };
                $(function () {
                    $('input:checkbox').change(function () {
                        if (!!$("[type=checkbox]:checked").length) {
                            document.getElementById('removeButton').classList.remove('disabled');
                            document.getElementById('removeButton').setAttribute("data-toggle", "modal");
                            document.getElementById('removeButton').setAttribute("data-target",
                                "#removeModal");
                        } else {
                            document.getElementById('removeButton').classList.add('disabled');
                            document.getElementById('removeButton').removeAttribute("data-toggle");
                            document.getElementById('removeButton').removeAttribute("data-target");


                        }
                    })
                });
            </script>

            </html>