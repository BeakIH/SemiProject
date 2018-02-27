<%@ page contentType="text/html; charset=UTF-8"%>
<script>
if("${param.result}" == 1){
	alert("수정되었습니다.");
	location.href = "./management_list.do?store_no=${param.store_no}";
}else{
	alert("비밀번호를 확인해주세요.");
	location.href = "./management_select.do?empNo=${param.empNo}";
}
/* if("${param.result}" == 1){
	alert("수정되었습니다."); 
	location.href = "./management_select.do?empNo=${param.empNo}";
}else{
	alert("비밀번호를 확인해주세요.");
	location.href = "./management_list.do?store_no=${param.store_no}"; */

</script>