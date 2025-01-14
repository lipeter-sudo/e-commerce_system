function isEmail(){
	var email=document.getElementById("email").value;
	var error=document.getElementById("isEmail");
	var reg=/^[A-Za-z]+\w+(-|\.|)+\w*\@\w+((\.|-)\w+)*\.\w+/;
	if(email=="")
		error.innerText="Email cannot be empty!";
	else
	{
		if(reg.test(email))
		{
			document.getElementById("email").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="Email format incorrect！";
	}
	document.getElementById("email").style.border="1px solid red";
	return false;
}

function isPhone(){
	var phone=document.getElementById("phone").value;
	var error=document.getElementById("isPhone");
	var reg=/0?(13|14|15|18)[0-9]{9}$/;
	if(phone=="")
		error.innerText="Mobile phone cannot be empty!";
	else
	{
		if(reg.test(phone))
		{
			document.getElementById("phone").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="The phone format is incorrect!";
	}
	document.getElementById("phone").style.border="1px solid red";
	return false;
}

function isPwd1(){
	var pwd1=document.getElementById("pwd1").value;
	var error=document.getElementById("isPwd1");
	var reg=/^[A-Za-z0-9_-]+$/;
	if(pwd1=="")
		error.innerText="Password cannot be empty!";
	else
	{
		if(reg.test(pwd1))
		{
			document.getElementById("pwd1").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="The password format is incorrect!";
	}
	document.getElementById("pwd1").style.border="1px solid red";
	return false;
}

function isPwd2(){
	var pwd2=document.getElementById("pwd2").value;
	var pwd1=document.getElementById("pwd1").value;
	var error=document.getElementById("isPwd2");
	if(pwd2=="")
		error.innerText="Cannot be empty!";
	else
	{
		if(pwd2==pwd1)
		{
			document.getElementById("pwd2").style.border="1px solid #669933";
			error.innerText="";
			return true;
		}
		else
			error.innerText="Password inconsistency!";
	}
	document.getElementById("pwd2").style.border="1px solid red";
	return false;
}

function isReg()
{
	if(isEmail()&&isPhone()&&isPwd1()&&isPwd2())
		document.getElementById("regForm").submit();
	else
		alert("Please complete the registration form!");
}





