function validateForm() {
  const Id_ = document.getElementById("ID_in").value.length;
  const Pw = document.getElementById("PW_").value;
  const Rpw = document.getElementById("RPW_").value;
  const Name = document.getElementById("NAME_").value;
  const Birth = document.getElementById("BIRTH_").value;
  const Gender = document.getElementById("gen").value;
  let error = false;

  // ID validation
  if (Id_ < 8 || Id_ > 16) {
    document.getElementById("id_inner").innerHTML = "8자리 이상 16자 이하";
    error = true;
  } else {
    document.getElementById("id_inner").innerHTML = "";
  }

  // Password validation
  const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
  if (!regExp.test(Pw)) {
    document.getElementById("pw_inner").innerHTML = "8자리 이상 16 자리 이하 영문, 숫자, 특수문자 포함";
    error = true;
  } else {
    document.getElementById("pw_inner").innerHTML = "";
  }

  // Repeat password validation
  if (Pw != Rpw) {
    document.getElementById("rpw_inner").innerHTML = "비밀번호가 일치하지 않습니다.";
    error = true;
  } else {
    document.getElementById("rpw_inner").innerHTML = "";
  }

  // Name validation
  if (Name == "") {
    document.getElementById("name_inner").innerHTML = "필수 정보 입니다.";
    error = true;
  } else {
    document.getElementById("name_inner").innerHTML = "";
  }

  // Birth validation
  if (Birth.length < 8) {
    document.getElementById("birth_inner").innerHTML = "생년월일 8자리 입력해주세요";
    error = true;
  } else {
    document.getElementById("birth_inner").innerHTML = "";
  }

  // Gender validation
  if (Gender == 0) {
    document.getElementById("gender_inner").innerHTML = "필수 정보입니다.";
    error = true;
  } else {
    document.getElementById("gender_inner").innerHTML = "";
  }

  // Check if there is any error
  if (error) {
    return false;
  } else {
    return true;
  }
}


function ID_input() {
  const Id_ = document.getElementById("ID_in").value.length;
  if (Id_ < 8 || Id_ > 16) {
    document.getElementById("id_inner").innerHTML = "8자리 이상 16자 이하";
  } else {
    document.getElementById("id_inner").innerHTML = "";
  }
}
function PW_input() {
    const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
    const Pw = document.getElementById("PW_").value;
   if (!regExp.test(Pw)){
      document.getElementById("pw_inner").innerHTML = "8자리 이상 16 자리 이하 영문, 숫자, 특수문자 포함"
   } else {
    document.getElementById("pw_inner").innerHTML = "";
  }
}

function RPW_input() {
  const Pw = document.getElementById("PW_").value;
    const Rpw = document.getElementById("RPW_").value;
    if (Pw != Rpw) {
    document.getElementById("rpw_inner").innerHTML = "비밀번호가 일치하지 않습니다.";
}   else {
    document.getElementById("rpw_inner").innerHTML = "";
  }
}

function NAME_input() {
  const Name = document.getElementById("NAME_").value;
  if (Name == "") {
    document.getElementById("name_inner").innerHTML = "필수 정보 입니다.";
  } else {
    document.getElementById("name_inner").innerHTML = "";
  }
}

function BIRTH_input() {
  const Birth = document.getElementById("BIRTH_").value;
  if (Birth.length < 8) {
    document.getElementById("birth_inner").innerHTML = "생년월일 8자리 입력해주세요";
  } else {
    document.getElementById("birth_inner").innerHTML = "";
  }
}

function GENDER_input() {
  const Gender = document.getElementById("gen").value;
    if (Gender == 0) {
    document.getElementById("gender_inner").innerHTML = "필수 정보입니다.";
    error = true;
  } else {
    document.getElementById("gender_inner").innerHTML = "";
  }
}