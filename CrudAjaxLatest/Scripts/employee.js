//Load Data in Table when documents is ready
$(document).ready(function () {

    loadData();
});

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
//Load Data function
function loadData() {
    var admin = getUrlVars()["isAdmin"];
    if (admin == "true") { $("#addemployeebtn").show(); $("#toShowwhenAdmin").show(); } else { $("#addemployeebtn").hide(); $("#toShowwhenAdmin").hide(); }
    $.ajax({
        url: "/Home/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.EmployeeID + '</td>';
                html += '<td>' + item.Name + '</td>';
                html += '<td>' + item.Age + '</td>';
                html += '<td>' + item.State + '</td>';
                html += '<td>' + item.Country + '</td>';
                if(admin == "true"){
                    html += '<td><a href="#" onclick="return getbyID(' + item.EmployeeID + ')">Edit</a> | <a href="#" onclick="Delele(' + item.EmployeeID + ')">Delete</a></td>';
                }
                html += '</tr>';
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//Add Data Function
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        EmployeeID: $('#EmployeeID').val(),
        Name: $('#Name').val(),
        Age: $('#Age').val(),
        State: $('#State').val(),
        Country: $('#Country').val()
    };
    $.ajax({
        url: "/Home/Add",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function Login() {
    var res = ValidateLogin();
    if (res == false) {
        return false;
    }
    var loginObj = {
        userName: $('#userName').val(),
        password: $('#password').val()
    };
    $.ajax({
        url: "/Login/LoginUser",
        data: JSON.stringify(loginObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {

            if (!$.trim(result)) {
                $("#errormsg").text("Invalid Username/Password");
            }
            else {
                debugger
                $.post('/Home/SetVariable',
           { key: "loggedUser", value: result[0].loggedUser }, function (data) {

           });

                location.href = '/Home/Index/?isAdmin=' + result[0].isAdmin;
            }


        },
        error: function (errormessage) {
            $("#errormsg").text("Please enter username/password")
            //alert(errormessage.responseText);
        }
    });
}
//Function for getting the Data Based upon Employee ID
function getbyID(EmpID) {
    $('#Name').css('border-color', 'lightgrey');
    $('#Age').css('border-color', 'lightgrey');
    $('#State').css('border-color', 'lightgrey');
    $('#Country').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Home/getbyID/" + EmpID,
        typr: "GET",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#EmployeeID').val(result.EmployeeID);
            $('#Name').val(result.Name);
            $('#Age').val(result.Age);
            $('#State').val(result.State);
            $('#Country').val(result.Country);
            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}
//function for updating employee's record
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var empObj = {
        EmployeeID: $('#EmployeeID').val(),
        Name: $('#Name').val(),
        Age: $('#Age').val(),
        State: $('#State').val(),
        Country: $('#Country').val(),
    };
    $.ajax({
        url: "/Home/Update",
        data: JSON.stringify(empObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#EmployeeID').val("");
            $('#Name').val("");
            $('#Age').val("");
            $('#State').val("");
            $('#Country').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}
//function for deleting employee's record
function Delele(ID) {
    var ans = confirm("Are you sure you want to delete this Record?");
    if (ans) {
        $.ajax({
            url: "/Home/Delete/" + ID,
            type: "POST",
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}
//Function for clearing the textboxes
function clearTextBox() {
    $('#EmployeeID').val("");
    $('#Name').val("");
    $('#Age').val("");
    $('#State').val("");
    $('#Country').val("");
    $('#btnUpdate').hide();
    $('#btnAdd').show();
    $('#Name').css('border-color', 'lightgrey');
    $('#Age').css('border-color', 'lightgrey');
    $('#State').css('border-color', 'lightgrey');
    $('#Country').css('border-color', 'lightgrey');
}

function ValidateLogin() {

    var isValid = true;
    if ($('#userName').val().trim() == "") {
        $('#userName').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#UserName').css('border-color', 'lightgrey');
    }
    if ($('#password').val().trim() == "") {
        $('#password').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#password').css('border-color', 'lightgrey');
    }
}

//Valdidation using jquery
function validate() {
    var isValid = true;
    if ($('#Name').val().trim() == "") {
        $('#Name').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Name').css('border-color', 'lightgrey');
    }
    if ($('#Age').val().trim() == "") {
        $('#Age').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Age').css('border-color', 'lightgrey');
    }
    if ($('#State').val().trim() == "") {
        $('#State').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#State').css('border-color', 'lightgrey');
    }
    if ($('#Country').val().trim() == "") {
        $('#Country').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#Country').css('border-color', 'lightgrey');
    }
    return isValid;
}