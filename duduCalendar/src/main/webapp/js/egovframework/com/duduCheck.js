function memberJoinCheck(form) {
	var idInput = form.applcntEmailAdres;
	var pwInput = form.entrprsMberPassword;
	var pwChkInput = form.entrprsMberPassword2;
	var nameInput = form.cmpnyNm;
	var departmentInput = form.orgnztNm;
	var rankInput = form.position;
	var idRegex = /^[a-z0-9]{5,20}$/;
	var pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{6,20}$/;

	if (isEmpty(idInput)) {
		alert("이메일을 입력해주세요.");
		idInput.focus();
		return false;
	}
	if (!idRegex.test(idInput.value)) {
		alert("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		idInput.focus();
		return false;
	}
	if (idInput.value.indexOf("@") !== -1) {
		alert("도메인은 제외하고 입력해주세요.");
		idInput.focus();
		return false;
	}
	if (idInput.value.indexOf("admin") !== -1) {
		alert("사용할 수 없는 문자가 포함되어 있습니다.")
		idInput.focus();
		return false;
	}
	if (isEmpty(pwInput)) {
		alert("비밀번호를 입력해주세요");
		pwInput.value = "";
		pwInput.focus();
		return false;
	}
	if (notEquals(pwInput, pwChkInput)) {
		alert("비밀번호가 일치하지 않습니다.");
		pwInput.value = "";
		pwChkInput.value = "";
		pwInput.focus();
		return false;
	}
	if (!pwRegex.test(pwInput.value)) {
		alert("비밀번호는 영문, 숫자, 특수문자를 각각 1개 이상 포함하여 6~20 글자로 사용해야 합니다.");
		pwInput.value = "";
        pwChkInput.value = "";
        pwInput.focus();
        return false;
	}
	if (isEmpty(nameInput)) {
		alert("이름을 입력해주세요.");
		nameInput.focus();
		return false;
	}
	if (departmentInput.value === "소속 부서를 선택하세요") {
		alert("부서를 선택해주세요.");
		departmentInput.focus();
		return false;
	}
	if (rankInput.value === "직급을 선택해주세요") {
		alert("직급을 선택해주세요.");
		rankInput.focus();
		return false;
	}
	return true;
}

function memberLoginCheck(f) {
	var idInput = f.id;
	var pwInput = f.password;
	if (isEmpty(idInput)) {
		alert("이메일을 입력해주세요");
		idInput.value = "";
		idInput.focus();
		return false;
	}
	if (idInput.value.indexOf("@duduit.co.kr") === -1) {
		idInput.value += "@duduit.co.kr";
		document.loginForm.submit();
	}
	
	return true;
}



