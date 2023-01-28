<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:query var="rs" dataSource="jdbc/HW_langs">
select id, lang, translation from HW_langs
</sql:query>



<!DOCTYPE html>
<html>
  <head>
    <title>Hello World</title>
    <style>
      @import url('https://fonts.googleapis.com/css?family=Style+Script');
      body {
        background-color: #0D0D0D;
        color: white;
        height: 100vh; /* set the height of the body to 100% of the viewport */
        display: flex; /* set the display property to flex */
        align-items: center; /* center the items vertically */
        justify-content: center; /* center the items horizontally */
      }

      .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        }

    #small-rectangle {
        width: 290px;
        height: 52px;
        background-color: #191919;
        margin-top: 20px;
        border-radius: 10px;
        display: table; 
    }
    
    label {
        display: table-cell;
        vertical-align: middle;
    }
        
    h1 {
        font-family:'Style Script', serif;
        font-size: 96px;
      }
      
    h2 {
        font-family: sans-serif;
        font-size: 17px;
      }
    
    #small-rectangle img {
        display: inline-block;
        vertical-align: middle;
        height: 20px;
        width: 32px;
        padding-top: 16px;
        padding-left: 8px;
        }


    input[type="radio"] {
        appearance: none;
        float: right;
        width: 15px;
        height: 15px;
        margin-right: 10px;
        border: 2px solid #ffffff;
        border-radius: 50%;
        background-clip: content-box;
        padding: 3px;
    }

    input[type="radio"]:checked {
        background-color: #ffffff;
    }

    .odsadenie {
        margin-right: 40px;
        font-family: sans-serif;
        font-weight: bold;
    }
    #nemecko {
        margin-left: 1.5px;
    }
    
    #meno {
    	padding-top: 250px;
    }

    </style>
  </head>

  <body>
    <div class="container">
        <h1 id="greeting">Hello World</h1>
        <div id="small-rectangle">
            <img src="https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/gb.png" alt="GB_flag">
            <label>
                <span class="odsadenie">English</span>
                <input type="radio" name="language" value="english" id="tlacidlo" checked>
            </label>
        </div>


        <div id="small-rectangle">
            <img src="https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/sk.png" alt="SK_flag">
            <label>
                <span class="odsadenie">Slovak</span>
                <input type="radio" name="language" value="slovak" id="tlacidlo">
            </label>
        </div>


        <div id="small-rectangle">
            <img src="https://raw.githubusercontent.com/hjnilsson/country-flags/master/png250px/de.png" alt="DE_flag" id="nemecko">
            <label>
                <span class="odsadenie">German</span>
                <input type="radio" name="language" value="german" id="tlacidlo">
            </label>
        </div>
      <div id="meno">
     	<h2>By: Dominik Hudak</h2> 
      </div>
      </div>
      
<script>
    var dict={};
    <c:forEach items="${rs.rows}" var="row">
      dict[`${row.lang}`]=`${row.translation}`;
    </c:forEach>
    const greeting = document.getElementById("greeting");
    const radioButtons = document.querySelectorAll("input[name='language']");

    for (let i = 0; i < radioButtons.length; i++) {
        radioButtons[i].addEventListener("change", function() {
            if (this.value === "english") {
                greeting.innerHTML = dict["EN"];
            }
            else if (this.value === "slovak") {
                greeting.innerHTML = dict["SK"];
            }
            else if (this.value === "german") {
                greeting.innerHTML = dict["DE"];
            }
        });
    }

  </script>
  </body>
</html>

