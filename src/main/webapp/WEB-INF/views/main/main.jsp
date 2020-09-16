<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #asideBack {
        width: 250px;
        height: 1200px;
        background: #E4EBF3;
    }
    #atManagementInfo {
        height: 98px;
        width: 250px;
        display: table-cell;
        vertical-align: middle;
        text-align: center;
    }
    #atManagementInfo img {
        position: relative;
        top: 3px;
        width: 17px;
        height: 17px;
        margin-top: 30px;
    }
    #atManegeTitle {
        display: inline-block;
        font-size: 15px;
        font-weight: bold;
        color: #004771;
        margin-bottom: 15px;
    }
    #atTimeCheck {
        width: 203px; 
        height: 27px; 
        background: white; 
        border: none; 
        margin: auto; 
        border-radius: 7px 7px 7px 7px; 
        margin-bottom: 10px; 
        font-size: 14px; 
        padding-top: 4px;
    }
    #goAtManage {
        width: 203px; 
        height: 27px; 
        background: #004771; 
        border: none; 
        margin: auto; 
        border-radius: 7px 7px 7px 7px; 
        color: white; 
        font-size: 14px; 
        font-weight: 550;
        padding-top: 4px;
    }
    #goAtManage:hover {
        cursor: pointer;
    }
    section>article:first-child {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 1100px; 
        height: 220px; 
        margin: auto; 
        margin-top: 35px; 
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
    }
    section>article:nth-child(2) {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 535px; 
        height: 285px; 
        margin-top: 35px; 
        margin-left: 38px;
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
        float: left;
    }
    section>article:nth-child(3) {
        border-radius: 10px 10px 10px 10px; 
        background: white; 
        width: 535px; 
        height: 285px; 
        margin-top: 35px;
        margin-left: 603px;
        box-shadow: 1px 2px 5px lightgray;
        padding-top: 15px;
        padding-bottom: 15px;
    }
    section>article:last-child {
        margin-top: 35px;
        text-align: center;
    }
    section>article:last-child>img {
        margin-left: 30px;
    }
    section>article:last-child>img:first-child {
        margin-left: 0;
    }
    #newNoticeList {
        width: 880px; 
        height: 200px;     
    }
    #eaList, #projectList {
        width: 495px;
        height: 200px;
        margin: auto;
        margin-top: 10px;
    }
    #eaList, #projectList, #newNoticeList {
        text-align: center; 
        border-collapse: collapse; 
        border-top: 3px solid #929292; 
        border-bottom: 3px solid #929292;
        margin-bottom: 3px;
    }
    #newNoticeList tr>td:first-child, #eaList tr>td:first-child, #projectList tr>td:first-child {
        text-align: left;
        padding-left: 20px;
    }
    #newNoticeList th, #eaList th, #projectList th {
        font-size: 14px;
        border-bottom: 3px double #929292;
    }
    #newNoticeList td, #eaList td, #projectList td {
        font-size: 13.5px;
        border-bottom: 1px solid #929292;
    }
    #newNoticeList tr:hover, #eaList tr:hover, #projectList tr:hover {
        cursor: pointer;
        background: rgb(211, 211, 211);
    }
    section>article:last-child>img:hover {
        cursor: pointer;
        
    }
    
    /* ======== Calendar ======== */
.my-calendar {
  width: 200px;
  margin: 30px;
  padding: 20px 20px 10px;
  text-align: center;
  font-weight: 800;
  border: 1px solid #ddd;
  cursor: default;
}
.my-calendar .clicked-date {
  border-radius: 25px;
  margin-top: 36px;
  float: left;
  width: 42%;
  padding: 46px 0 26px;
  background: #ddd;
}
.my-calendar .calendar-box {
  float: right;
  width: 100%;
  padding-left: 10px;
}

.clicked-date .cal-day {
  font-size: 24px;
}
.clicked-date .cal-date {
  font-size: 130px;
}

.ctr-box {
  padding: 0 16px;
  margin-bottom: 20px;
  font-size: 20px;
}
.ctr-box .btn-cal {
  position: relative;
  float: left;
  width: 25px;
  height: 25px;
  margin-top: 5px;
  font-size: 16px;
  cursor: pointer;
  border: none;
  background: none;
}
.ctr-box .btn-cal:after {
  content: '<';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  line-height: 25px;
  font-weight: bold;
  font-size: 20px;
}
.ctr-box .btn-cal.next {
  float: right;
}
.ctr-box .btn-cal.next:after {
  content: '>';
}

.cal-table {
  width: 100%;
}
.cal-table th {
  width: 14.2857%;
  padding-bottom: 5px;
  font-size: 16px;
  font-weight: 900;
}
.cal-table td {
  padding: 3px 0;
  height: 50px;
  font-size: 15px;
  vertical-align: middle;
}
.cal-table td.day {
  position: relative;
  cursor: pointer;
}
.cal-table td.today {
  background: #ffd255;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.day-active {
  background: #ff8585;
  border-radius: 50%;
  color: #fff;
}
.cal-table td.has-event:after {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 4px;
  background: #FFC107;
}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"></jsp:include>

    <aside style="float: left;">
        <div id="asideBack">
            <div id="atManagementInfo">
                <img src="${ contextPath }/resources/mainImages/mainAtManagementIcon.png">
                <div id="atManegeTitle">&nbsp;출퇴근 관리</div>
                <div id="atTimeCheck">
                    <b>출근</b>  <!-- 출근등록시간 출력(미등록시 미등록) -->미등록<!--출근등록시간 출력 끝-->
                    &nbsp;&nbsp;ㅣ&nbsp;&nbsp;
                    <b>퇴근</b>  <!-- 퇴근등록시간 출력(미등록시 미등록) -->미등록<!--퇴근등록시간 출력 끝--> 
                </div>
                <div id="goAtManage">
                    출퇴근 등록
                </div>
            </div>
              <!-- // .my-calendar -->
            <div class="container">
  <div class="my-calendar clearfix">
    <!-- <div class="clicked-date">
      <div class="cal-day"></div>
      <div class="cal-date"></div>
    </div> -->
    <div class="calendar-box">
      <div class="ctr-box clearfix">
        <button type="button" title="prev" class="btn-cal prev">
        </button>
        <span class="cal-month"></span>
        <span class="cal-year"></span>
        <button type="button" title="next" class="btn-cal next">
        </button>
      </div>
      <table class="cal-table">
        <thead>
          <tr>
            <th>S</th>
            <th>M</th>
            <th>T</th>
            <th>W</th>
            <th>T</th>
            <th>F</th>
            <th>S</th>
          </tr>
        </thead>
        <tbody class="cal-body"></tbody>
      </table>
    </div>
  </div>
</div>

<script type="text/javascript">
//================================
//START YOUR APP HERE
//================================
const init = {
monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
today: new Date(),
monForChange: new Date().getMonth(),
activeDate: new Date(),
getFirstDay: (yy, mm) => new Date(yy, mm, 1),
getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
nextMonth: function () {
 let d = new Date();
 d.setDate(1);
 d.setMonth(++this.monForChange);
 this.activeDate = d;
 return d;
},
prevMonth: function () {
 let d = new Date();
 d.setDate(1);
 d.setMonth(--this.monForChange);
 this.activeDate = d;
 return d;
},
addZero: (num) => (num < 10) ? '0' + num : num,
activeDTag: null,
getIndex: function (node) {
 let index = 0;
 while (node = node.previousElementSibling) {
   index++;
 }
 return index;
}
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
* @param {number} date
* @param {number} dayIn
*/
function loadDate (date, dayIn) {
document.querySelector('.cal-date').textContent = date;
document.querySelector('.cal-day').textContent = init.dayList[dayIn];
}

/**
* @param {date} fullDate
*/
function loadYYMM (fullDate) {
let yy = fullDate.getFullYear();
let mm = fullDate.getMonth();
let firstDay = init.getFirstDay(yy, mm);
let lastDay = init.getLastDay(yy, mm);
let markToday;  // for marking today date

if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
 markToday = init.today.getDate();
}

document.querySelector('.cal-month').textContent = init.monList[mm];
document.querySelector('.cal-year').textContent = yy;

let trtd = '';
let startCount;
let countDay = 0;
for (let i = 0; i < 6; i++) {
 trtd += '<tr>';
 for (let j = 0; j < 7; j++) {
   if (i === 0 && !startCount && j === firstDay.getDay()) {
     startCount = 1;
   }
   if (!startCount) {
     trtd += '<td>'
   } else {
     let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
     trtd += '<td class="day';
     trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
     trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
   }
   trtd += (startCount) ? ++countDay : '';
   if (countDay === lastDay.getDate()) { 
     startCount = 0; 
   }
   trtd += '</td>';
 }
 trtd += '</tr>';
}
$calBody.innerHTML = trtd;
}

/**
* @param {string} val
*/
function createNewList (val) {
let id = new Date().getTime() + '';
let yy = init.activeDate.getFullYear();
let mm = init.activeDate.getMonth() + 1;
let dd = init.activeDate.getDate();
const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

let date = yy + '.' + init.addZero(mm) + '.' + init.addZero(dd);

let eventData = {};
eventData['date'] = date;
eventData['memo'] = val;
eventData['complete'] = false;
eventData['id'] = id;
init.event.push(eventData);
$todoList.appendChild(createLi(id, val, date));
}

loadYYMM(init.today);
loadDate(init.today.getDate(), init.today.getDay());

$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

$calBody.addEventListener('click', (e) => {
if (e.target.classList.contains('day')) {
 if (init.activeDTag) {
   init.activeDTag.classList.remove('day-active');
 }
 let day = Number(e.target.textContent);
 loadDate(day, e.target.cellIndex);
 e.target.classList.add('day-active');
 init.activeDTag = e.target;
 init.activeDate.setDate(day);
 reloadTodo();
}
});
</script>
  <!-- // .my-calendar -->
            
            
            
            
            
        </div>
    </aside>

    <section style="margin-left: 250px;">
        
<!--바로가기 버튼영역-->
        <article>
            <img src="${ contextPath }/resources/mainImages/eaBtn.png" onclick="location.href='approvalIng.ea'">
            <img src="${ contextPath }/resources/mainImages/projectBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/fileBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/addressBtn.png" onclick="location.href='#'">
            <img src="${ contextPath }/resources/mainImages/messangerBtn.png" onclick="location.href='#'">
        </article>
        <!--공지사항-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainNoticeLogo.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="eaList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>

        <!--진행중인프로젝트-->
        <article>
            <img src="${ contextPath }/resources/mainImages/mainProjectLogo.png" width="495px" height="50px" style="margin-left: 20px;">
            <table id="projectList">
                <tr style="background: #f6f6f6;">
                    <th width="400px">제목</th>
                    <th>등록일</th>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
                <tr>
                    <td>제모오오오오오오옥</td>
                    <td>2020/08/21</td>
                </tr>
            </table>
            <a href="#" style="padding-left: 470px; color:gray; font-size: 13px;">더보기</a>
        </article>

        
    </section>
</body>
</html>