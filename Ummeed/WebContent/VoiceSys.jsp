<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <%
if(!("true".equals((String)session.getAttribute("loginsuccess")))){
	response.sendRedirect("login.jsp");
}

%> --%>
<head>

<script>
(function(e, p){
    var m = location.href.match(/platform=(win8|win|mac|linux|cros)/);
    e.id = (m && m[1]) ||
           (p.indexOf('Windows NT 6.2') > -1 ? 'win8' : p.indexOf('Windows') > -1 ? 'win' : p.indexOf('Mac') > -1 ? 'mac' : p.indexOf('CrOS') > -1 ? 'cros' : 'linux');
    e.className = e.className.replace(/\bno-js\b/,'js');
  })(document.documentElement, window.navigator.userAgent)
    </script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/styleW.css">
 <link rel="stylesheet" href="css/animate.css">

 <meta charset="utf-8">
    <meta content="initial-scale=1, minimum-scale=1, width=device-width" name="viewport">
    <meta content=
    "Google Chrome is a browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier."
    name="description">
    <title>
     Speech To Text
    </title>
    <link href="https://plus.google.com/100585555255542998765" rel="publisher">
    <link href="//www.google.com/images/icons/product/chrome-32.png" rel="icon" type="image/ico">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;subset=latin" rel="stylesheet">
    <link href="/intl/en/chrome/assets/common/css/chrome.min.css" rel="stylesheet">
    <script src="//www.google.com/js/gweb/analytics/autotrack.js">
</script>
    <script>
/* new gweb.analytics.AutoTrack({
          profile: 'UA-26908291-1'
        }); */
    </script>
    <style>
#info {
    font-size: 20px;
    text-align: center;
    }
    #div_start {
    float: right;
    }
    #headline {
    text-decoration: none;
    text-align: center;
    }
    #results {
    font-size: 14px;
    font-weight: bold;
    border: 1px solid #ddd;
    padding: 15px;
    text-align: left;
    min-height: 150px;
    }
    #start_button {
    border: 0;
    background-color:transparent;
    padding: 0;
    }
    .interim {
    color: gray;
    }
    .final {
    color: black;
    padding-right: 3px;
    }
    .button {
    display: none;
    }
    .marquee {
    margin: 20px auto;
    }

    #buttons {
    margin: 10px 0;
    position: relative;
    top: -50px;
    }

    #copy {
    margin-top: 20px;
    }

    #copy > div {
    display: none;
    margin: 0 70px;
    }
    </style>
    <style>
a.c1 {font-weight: normal;}
    </style>




</head>

<body style="background-image: url('bg.png');">
<div class="header">Speech-To-Text</div>
<%-- <div class="title animated bounceInUp">Welcome <%=(String)request.getAttribute("User")!=null ? (String)request.getAttribute("User"):"" %></div> --%>
<div class="container">
<!-- <a href="Res.jsp" class="button1" ><input type="button" name="commit" value="Reservation"></a>
<a href="Attendence.jsp" class="button2"><input type="button" name="commit" value="Literacy"></a>
<a href="Search.jsp" class="button3"><input type="button" name="commit" value="Existing System Change"></a>
<a href="Logout.jsp" class="button4"><input type="button" name="commit" value="Logout"></a> -->






    <div class="browser-landing" id="main">
      <div class="compact marquee-stacked" id="marquee">
        <div class="marquee-copy">
          <h1 style="text-align: center;">
            <!-- <a class="c1" href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html">Speech Recognization System</a> -->
          </h1>
        </div>
      </div>
      <div class="compact marquee">
        <div id="info">
          <p id="info_start">
            Click on the microphone icon and begin speaking for as long as you like.
          </p>
          <p id="info_speak_now" style="display:none">
            SPEAK NOW.
          </p>
          <p id="info_no_speech" style="display:none">
            No speech was detected. You may need to adjust your <a href=
            "//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">microphone
            settings</a>.
          </p>
          <p id="info_no_microphone" style="display:none">
            No microphone was found. Ensure that a microphone is installed and that
            <a href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
            microphone settings</a> are configured correctly.
          </p>
          <p id="info_allow" style="display:none">
            Click the "Allow" button above to enable your microphone.
          </p>
          <p id="info_denied" style="display:none">
            Permission to use microphone was denied.
          </p>
          <p id="info_blocked" style="display:none">
            Permission to use microphone is blocked. To change, go to
            chrome://settings/contentExceptions#media-stream
          </p>
          <p id="info_upgrade" style="display:none">
            Web Speech API is not supported by this browser. Upgrade to <a href=
            "//www.google.com/chrome">Chrome</a> version 25 or later.
          </p>
        </div>
        <div id="div_start">
          <button id="start_button" onclick="startButton(event)"><img alt="Start" id="start_img"
          src="mic.png"></button>
        </div>
        <div id="results">
          <span class="final" id="final_span"></span> <span class="interim" id=
          "interim_span"></span>
        </div>
        <div id="copy">
          <button class="button" id="copy_button" onclick="copyButton()">Copy and Paste</button>
          <div id="copy_info">
            <p>
              Press Control-C to copy text.
            </p>
            <p>
              (Command-C on Mac.)
            </p>
          </div><!-- <button class="button" id="email_button" onclick="emailButton()">Create
          Email</button> -->
         <!--  <div id="email_info">
            <p>
              Text sent to default email application.
            </p>
            <p>
              (See chrome://settings/handlers to change.)
            </p>
          </div> -->
        </div>
        <div class="compact marquee" id="div_language">
          <select id="select_language" onchange="updateCountry()">
            </select>&nbsp;&nbsp; <select id="select_dialect">
            </select>
        </div>
      </div>
    </div><script src="/intl/en/chrome/assets/common/js/chrome.min.js">
</script> <script>
var chrmMenuBar = new chrm.ui.MenuBar();
      chrmMenuBar.decorate('nav');
      var chrmLogo = new chrm.ui.Logo('logo');

      var chrmscroll = new chrm.ui.SmoothScroll('scroll');
      chrmscroll.init();



  window.___gcfg = { lang: 'en' };
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();




      var doubleTracker = new gweb.analytics.DoubleTrack('floodlight', {
          src: 2542116,
          type: 'clien612',
          cat: 'chrom0'
      });
      doubleTracker.track();

      doubleTracker.trackClass('doubletrack', true);
    </script> <script>
var langs =
[['Afrikaans',       ['af-ZA']],
 ['Bahasa Indonesia',['id-ID']],
 ['Bahasa Melayu',   ['ms-MY']],
 ['Català',          ['ca-ES']],
 ['Čeština',         ['cs-CZ']],
 ['Dansk',           ['da-DK']],
 ['Deutsch',         ['de-DE']],
 ['English',         ['en-AU', 'Australia'],
                     ['en-CA', 'Canada'],
                     ['en-IN', 'India'],
                     ['en-NZ', 'New Zealand'],
                     ['en-ZA', 'South Africa'],
                     ['en-GB', 'United Kingdom'],
                     ['en-US', 'United States']],
 ['Español',         ['es-AR', 'Argentina'],
                     ['es-BO', 'Bolivia'],
                     ['es-CL', 'Chile'],
                     ['es-CO', 'Colombia'],
                     ['es-CR', 'Costa Rica'],
                     ['es-EC', 'Ecuador'],
                     ['es-SV', 'El Salvador'],
                     ['es-ES', 'España'],
                     ['es-US', 'Estados Unidos'],
                     ['es-GT', 'Guatemala'],
                     ['es-HN', 'Honduras'],
                     ['es-MX', 'México'],
                     ['es-NI', 'Nicaragua'],
                     ['es-PA', 'Panamá'],
                     ['es-PY', 'Paraguay'],
                     ['es-PE', 'Perú'],
                     ['es-PR', 'Puerto Rico'],
                     ['es-DO', 'República Dominicana'],
                     ['es-UY', 'Uruguay'],
                     ['es-VE', 'Venezuela']],
 ['Euskara',         ['eu-ES']],
 ['Filipino',        ['fil-PH']],
 ['Français',        ['fr-FR']],
 ['Galego',          ['gl-ES']],
 ['Hrvatski',        ['hr_HR']],
 ['IsiZulu',         ['zu-ZA']],
 ['Íslenska',        ['is-IS']],
 ['Italiano',        ['it-IT', 'Italia'],
                     ['it-CH', 'Svizzera']],
 ['Lietuvių',        ['lt-LT']],
 ['Magyar',          ['hu-HU']],
 ['Nederlands',      ['nl-NL']],
 ['Norsk bokmål',    ['nb-NO']],
 ['Polski',          ['pl-PL']],
 ['Português',       ['pt-BR', 'Brasil'],
                     ['pt-PT', 'Portugal']],
 ['Română',          ['ro-RO']],
 ['Slovenščina',     ['sl-SI']],
 ['Slovenčina',      ['sk-SK']],
 ['Suomi',           ['fi-FI']],
 ['Svenska',         ['sv-SE']],
 ['Tiếng Việt',      ['vi-VN']],
 ['Türkçe',          ['tr-TR']],
 ['Ελληνικά',        ['el-GR']],
 ['български',       ['bg-BG']],
 ['Pусский',         ['ru-RU']],
 ['Српски',          ['sr-RS']],
 ['Українська',      ['uk-UA']],
 ['한국어',            ['ko-KR']],
 ['中文',             ['cmn-Hans-CN', '普通话 (中国大陆)'],
                     ['cmn-Hans-HK', '普通话 (香港)'],
                     ['cmn-Hant-TW', '中文 (台灣)'],
                     ['yue-Hant-HK', '粵語 (香港)']],
 ['日本語',           ['ja-JP']],
 ['हिन्दी',            ['hi-IN']],
 ['ภาษาไทย',         ['th-TH']]];

for (var i = 0; i < langs.length; i++) {
  select_language.options[i] = new Option(langs[i][0], i);
}
select_language.selectedIndex = 7;
updateCountry();
select_dialect.selectedIndex = 6;
showInfo('info_start');

function updateCountry() {
  for (var i = select_dialect.options.length - 1; i >= 0; i--) {
    select_dialect.remove(i);
  }
  var list = langs[select_language.selectedIndex];
  for (var i = 1; i < list.length; i++) {
    select_dialect.options.add(new Option(list[i][1], list[i][0]));
  }
  select_dialect.style.visibility = list[1].length == 1 ? 'hidden' : 'visible';
}

var create_email = false;
var final_transcript = '';
var recognizing = false;
var ignore_onend;
var start_timestamp;
if (!('webkitSpeechRecognition' in window)) {
  upgrade();
} else {
  start_button.style.display = 'inline-block';
  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = function() {
    recognizing = true;
    showInfo('info_speak_now');
    start_img.src = 'mic.png';
  };

  recognition.onerror = function(event) {
    if (event.error == 'no-speech') {
      start_img.src = 'mic.png';
      showInfo('info_no_speech');
      ignore_onend = true;
    }
    if (event.error == 'audio-capture') {
      start_img.src = 'mic.png';
      showInfo('info_no_microphone');
      ignore_onend = true;
    }
    if (event.error == 'not-allowed') {
      if (event.timeStamp - start_timestamp < 100) {
        showInfo('info_blocked');
      } else {
        showInfo('info_denied');
      }
      ignore_onend = true;
    }
  };

  recognition.onend = function() {
    recognizing = false;
    if (ignore_onend) {
      return;
    }
    start_img.src = 'mic.png';
    if (!final_transcript) {
      showInfo('info_start');
      return;
    }
    showInfo('');
    if (window.getSelection) {
      window.getSelection().removeAllRanges();
      var range = document.createRange();
      range.selectNode(document.getElementById('final_span'));
      window.getSelection().addRange(range);
    }
    if (create_email) {
      create_email = false;
      createEmail();
    }
  };

  recognition.onresult = function(event) {
    var interim_transcript = '';
    if (typeof(event.results) == 'undefined') {
      recognition.onend = null;
      recognition.stop();
      upgrade();
      return;
    }
    for (var i = event.resultIndex; i < event.results.length; ++i) {
      if (event.results[i].isFinal) {
        final_transcript += event.results[i][0].transcript;
      } else {
        interim_transcript += event.results[i][0].transcript;
      }
    }
    final_transcript = capitalize(final_transcript);
    final_span.innerHTML = linebreak(final_transcript);
    interim_span.innerHTML = linebreak(interim_transcript);
    if (final_transcript || interim_transcript) {
      showButtons('inline-block');
    }
  };
}

function upgrade() {
  start_button.style.visibility = 'hidden';
  showInfo('info_upgrade');
}

var two_line = /\n\n/g;
var one_line = /\n/g;
function linebreak(s) {
  return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
}

var first_char = /\S/;
function capitalize(s) {
  return s.replace(first_char, function(m) { return m.toUpperCase(); });
}

/* function createEmail() {
  var n = final_transcript.indexOf('\n');
  if (n < 0 || n>= 80) {
    n = 40 + final_transcript.substring(40).indexOf(' ');
  }
  var subject = encodeURI(final_transcript.substring(0, n));
  var body = encodeURI(final_transcript.substring(n + 1));
  window.location.href = 'mailto:?subject=' + subject + '&body=' + body;
} */

function copyButton() {
  if (recognizing) {
    recognizing = false;
    recognition.stop();
  }
  copy_button.style.display = 'none';
  copy_info.style.display = 'inline-block';
  showInfo('');
}

function emailButton() {
  if (recognizing) {
    create_email = true;
    recognizing = false;
    recognition.stop();
  } else {
    createEmail();
  }
  email_button.style.display = 'none';
  email_info.style.display = 'inline-block';
  showInfo('');
}

function startButton(event) {
  if (recognizing) {
    recognition.stop();
    return;
  }
  final_transcript = '';
  recognition.lang = select_dialect.value;
  recognition.start();
  ignore_onend = false;
  final_span.innerHTML = '';
  interim_span.innerHTML = '';
  start_img.src = 'mic.png';
  showInfo('info_allow');
  showButtons('none');
  start_timestamp = event.timeStamp;
}

function showInfo(s) {
  if (s) {
    for (var child = info.firstChild; child; child = child.nextSibling) {
      if (child.style) {
        child.style.display = child.id == s ? 'inline' : 'none';
      }
    }
    info.style.visibility = 'visible';
  } else {
    info.style.visibility = 'hidden';
  }
}

var current_style;
function showButtons(style) {
  if (style == current_style) {
    return;
  }
  current_style = style;
  copy_button.style.display = style;
  email_button.style.display = style;
  copy_info.style.display = 'none';
  email_info.style.display = 'none';
}
    </script>












</div>

<div class="footer"></div>
</body>

<script type="text/javascript">
window.history.forward(1);
function noBack(){
window.history.forward();
}
</script>
</html>