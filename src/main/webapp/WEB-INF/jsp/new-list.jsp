<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <html lang="en">

        <jsp:include page="include/header.jsp" />

        <body>
            <jsp:include page="include/navbar.jsp" />

            <div class="container main" style="overflow: hidden;overflow-y: auto;">
                <h1>new list</h1>
                <input type="hidden" name="count" value="1" />
                <form id="newListForm" class="form-horizontal new-list-form" data-toggle="validator" style="height: 80% !important;" action="/todo/new-list"
                    method="post" modelAttribute="list">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">List name</label>
                        <div class="col-sm-10">
                            <input class="form-control" style="width: 50%; min-width: 200px;" name="name" type="text" placeholder="Enter list name here"
                                required pattern="^[_A-z0-9 ]{1,}$" data-error="No commas are allowed!">
                        </div>
                    </div>
                    <div class="form-group" style="overflow: hidden;overflow-y: auto; height: 85%;">
                        <label class="col-sm-2 control-label">List name</label>
                        <table class="table-list col-sm-10">
                            <tbody id="myTable">
                                <tr>
                                    <th class="td-list"></th>
                                    <th class="td-list"></th>
                                    <th class="td-list"></th>
                                </tr>
                                <tr id="tr1" class="tr-list">
                                    <td id="td1" class="td-list td-left">
                                        <div class="div-left entry input-group col-xs-3">
                                            <input class="form-control" name="listItemNames" placeholder="new item" type="text" required pattern="^[_A-z0-9 ]{1,}$" data-error="No commas are allowed!">
                                            <span class="input-group-btn">
					                        <button class="btn btn-remove btn-danger" type="button" style="font-size: 14px;"><span class="glyphicon glyphicon-minus"></span></button>
                                            </span>
                                        </div>
                                    </td>
                                    <td id="td2" class="td-list td-center">
                                        <div class="div-center entry input-group col-xs-3">
                                            <input class="form-control" name="listItemNames" placeholder="new item" type="text" required pattern="^[_A-z0-9 ]{1,}$" data-error="No commas are allowed!">
                                            <span class="input-group-btn">
					                        <button class="btn btn-remove btn-danger" type="button" style="font-size: 14px;"><span class="glyphicon glyphicon-minus"></span></button>
                                            </span>
                                        </div>
                                    </td>
                                    <td id="td3" class="td-list td-right">
                                        <div class="div-right entry input-group col-xs-3">
                                            <input class="form-control" name="listItemNames" placeholder="new item" type="text" required pattern="^[_A-z0-9 ]{1,}$" data-error="No commas are allowed!">
                                            <span class="input-group-btn">
					                        <button class="btn btn-success btn-add" type="button" style="font-size: 14px;"><span class="glyphicon glyphicon-plus"></span></button>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button id="submitButton" type="submit" class="btn btn-success" style="float: left; margin-top: 20px;">Save</button>
                    <a href="/todo" class="btn btn-default" style="float: left; margin-top: 20px; margin-left: 20px;">Dismiss</a>
                </form>
            </div>
        </body>

        <jsp:include page="include/footer.jsp" />

        <script type="text/javascript">
            function addNew(count, content) {
                var tdClass = "td-right";
                if (count % 3 === 0) {
                    tdClass = "td-left";
                } else
                if (count % 3 === 1) {
                    tdClass = "td-center";
                }
                if (count % 3 == 0) {
                    return '<tr id="tr' + (Math.floor((count - 1) / 3) + 2) + '" class="tr-list"><td id="td' + (count +
                            1) +
                        '" class="td-list ' +
                        tdClass + '">' + content + '</td></tr>';
                } else {
                    return '<td id="td' + (count + 1) + '" class="td-list ' + tdClass + '">' + content + '</td>';
                }
            };

            function updateClonedDiv(count, clonedDiv) {
                $(clonedDiv).find('input').val('');
                $(clonedDiv).removeClass("div-left").removeClass("div-center").removeClass("div-right");

                if (count % 3 === 0) {
                    $(clonedDiv).addClass("div-left");
                } else
                if (count % 3 === 1) {
                    $(clonedDiv).addClass("div-center");
                } else {
                    $(clonedDiv).addClass("div-right");
                }
            };

            function updateAllDivs(count, divs) {
                for (index = 1; index <= count; index++) {
                    $(divs[index - 1]).removeClass("div-left").removeClass("div-center").removeClass(
                        "div-right");
                    $(divs[index - 1]).detach().appendTo('#td' + index);
                    if (index % 3 == 0) {
                        $(divs[index - 1]).addClass("div-right");
                    } else if (index % 3 == 1) {
                        $(divs[index - 1]).addClass("div-left");
                    } else {
                        $(divs[index - 1]).addClass("div-center");
                    }
                }
            };

            $(function () {
                var count = 3;
                $(document)
                    .on('click', '.btn-add', function (e) {
                        e.preventDefault();

                        var myTable = $("#myTable");
                        var currentDiv = $(this).parents('.entry:first');
                        var clonedDiv = currentDiv.clone()[0];

                        updateClonedDiv(count, clonedDiv);

                        var newContent = addNew(count, clonedDiv.outerHTML);
                        if (count % 3 == 0) {
                            myTable.append(newContent);
                        } else {
                            myTable.children().last().append(newContent);
                        }

                        myTable.find('.entry:not(:last) .btn-add')
                            .removeClass('btn-add').addClass('btn-remove')
                            .removeClass('btn-success').addClass('btn-danger')
                            .html('<span class="glyphicon glyphicon-minus"></span>');

                        count = count + 1;
                    })
                    .on('click', '.btn-remove', function (e) {
                        $(this).parents('.entry:first').remove();

                        count = count - 1;
                        updateAllDivs(count, $("#myTable").find('div'));
                        $("#myTable").find('td:not(:has(div))').remove();
                        $("#myTable").find('tr:not(:has(td,th))').remove();

                        e.preventDefault();
                        return false;
                    });
            });
        </script>

        </html>