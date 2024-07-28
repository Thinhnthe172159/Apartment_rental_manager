/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// validate phone
function validatePhoneNumber(phoneNumber) {
    // Ví dụ về một biểu thức chính quy để kiểm tra số điện thoại Việt Nam
    const phonePattern = /^(?:\+84|84|0)[3|5|7|8|9]\d{8}$/;
    return phonePattern.test(phoneNumber);
}

document.getElementById('phone').addEventListener('input', function () {
    const phoneNumber = this.value;
    const errorMessage = document.getElementById('error-message');

    if (validatePhoneNumber(phoneNumber)) {
        errorMessage.style.display = 'none';
    } else {
        errorMessage.style.display = 'block';
    }
});


function validateVietnameseFullName(fullName) {
    // Regular expression for Vietnamese characters with diacritics
    const vietnameseNameRegex = /^[A-ZÀÁẢÃẠÂẤẦẨẪẬĂẰẲẴẶĐÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỐỒỔỖỘƠỜỞỠỢÙÚỦŨỤƯỪỬỮỰỲÝỶỸỴ\s]+$/i;

    // Check if the name matches the regular expression
    if (!vietnameseNameRegex.test(fullName)) {
        return "Tên đầy đủ phải chỉ chứa chữ cái tiếng Việt có dấu và khoảng trắng.";
    }


    return null; // No errors found
}

// validate full name
const fullNameInput = document.getElementById('full-name');
const errorMessage = document.getElementById('error-message2');

fullNameInput.addEventListener('input', function () {
    const fullName = this.value;
    const errorMessageText = validateVietnameseFullName(fullName);

    if (errorMessageText) {
        errorMessage.textContent = errorMessageText;
        errorMessage.style.display = 'block';
    } else {
        errorMessage.textContent = '';
        errorMessage.style.display = 'none';
    }
});

//validate năm sinh

function calculateAge(birthDate) {
    const today = new Date();
    const birthDateObj = new Date(birthDate);
    let age = today.getFullYear() - birthDateObj.getFullYear();
    const monthDiff = today.getMonth() - birthDateObj.getMonth();

    // Nếu ngày sinh trong năm hiện tại chưa đến
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDateObj.getDate())) {
        age--;
    }

    return age;
}

// Hàm kiểm tra tuổi có từ 18 đến 100 không
function validateAge(birthDate) {
    const age = calculateAge(birthDate);
    return age >= 18 && age <= 100;
}

// Xử lý sự kiện input
document.getElementById('birth-date').addEventListener('input', function () {
    const birthDate = this.value;
    const errorMessage = document.getElementById('error-message3');

    // Kiểm tra tuổi và hiển thị thông báo lỗi nếu cần
    if (validateAge(birthDate)) {
        errorMessage.style.display = 'none';
    } else {
        errorMessage.style.display = 'block';
    }
});




// Hàm kiểm tra định dạng số căn cước công dân
function validateCCCD(cccd) {
    // Kiểm tra nếu số CCCD có đúng 12 chữ số
    const cccdPattern = /^\d{12}$/;
    return cccdPattern.test(cccd);
}

// Xử lý sự kiện input
document.getElementById('cccd-input').addEventListener('input', function () {
    const cccd = this.value;
    const errorMessage = document.getElementById('error-message4');

    // Kiểm tra số CCCD và hiển thị thông báo lỗi nếu cần
    if (validateCCCD(cccd)) {
        errorMessage.style.display = 'none';
    } else {
        errorMessage.style.display = 'block';
    }
});


// Hàm kiểm tra ngày cấp căn cước công dân
function validateDate() {
    const dateInput = document.getElementById('dateInput').value;
    const errorSpan = document.getElementById('errorSpan');
    const minDate = new Date('2015-01-01');
    const currentDate = new Date();

    // Đặt thời gian của currentDate để so sánh chỉ ngày, không bao gồm giờ
    currentDate.setHours(0, 0, 0, 0);

    if (!dateInput) {
        errorSpan.textContent = ''; // Không có lỗi nếu chưa chọn ngày
        return;
    }

    const selectedDate = new Date(dateInput);

    // Đặt thời gian của selectedDate để so sánh chỉ ngày, không bao gồm giờ
    selectedDate.setHours(0, 0, 0, 0);

    if (selectedDate < minDate) {
        errorSpan.textContent = 'Ngày không được trước ngày 01/01/2015.';
    } else if (selectedDate > currentDate) {
        errorSpan.textContent = 'Ngày không được sau ngày hiện tại.';
    } else {
        errorSpan.textContent = ''; // Không có lỗi
    }
}

document.getElementById('dateInput').addEventListener('change', validateDate);

function validateForm() {
    let isValid = true;

    // Kiểm tra số điện thoại
    const phoneNumber = document.getElementById('phone').value;
    if (!validatePhoneNumber(phoneNumber)) {
        document.getElementById('error-message').style.display = 'block';
        isValid = false;
    } else {
        document.getElementById('error-message').style.display = 'none';
    }

    // Kiểm tra họ tên
    const fullName = document.getElementById('full-name').value;
    const fullNameError = validateVietnameseFullName(fullName);
    if (fullNameError) {
        document.getElementById('error-message2').textContent = fullNameError;
        document.getElementById('error-message2').style.display = 'block';
        isValid = false;
    } else {
        document.getElementById('error-message2').textContent = '';
        document.getElementById('error-message2').style.display = 'none';
    }

    // Kiểm tra ngày sinh
    const birthDate = document.getElementById('birth-date').value;
    if (!validateAge(birthDate)) {
        document.getElementById('error-message3').style.display = 'block';
        isValid = false;
    } else {
        document.getElementById('error-message3').style.display = 'none';
    }

    // Kiểm tra CCCD
    const cccd = document.getElementById('cccd-input').value;
    if (!validateCCCD(cccd)) {
        document.getElementById('error-message4').style.display = 'block';
        isValid = false;
    } else {
        document.getElementById('error-message4').style.display = 'none';
    }

    // Kiểm tra ngày cấp CCCD
    const dateInput = document.getElementById('dateInput').value;
    const minDate = new Date('2015-01-01');
    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0);
    const selectedDate = new Date(dateInput);
    selectedDate.setHours(0, 0, 0, 0);

    if (!dateInput || selectedDate < minDate || selectedDate > currentDate) {
        document.getElementById('errorSpan').textContent = 'Ngày cấp không hợp lệ';
        isValid = false;
    } else {
        document.getElementById('errorSpan').textContent = '';
    }

    return isValid;
}

// Xử lý sự kiện nhấn nút "Lưu"
document.querySelector('button[type="submit"]').addEventListener('click', function (event) {
    if (!validateForm()) {
        event.preventDefault(); // Ngăn không gửi form nếu có lỗi
    }
});
