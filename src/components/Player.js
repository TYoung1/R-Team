import React from 'react'
import "./Player.css"
function Player() {
  return (
    <div class="main">
    <div class="wrapper">
        <div class="main_player">
            <div class="ground">
                <div class="song" id="one"></div>
                <div class="song" id="two"></div>
                <div class="song" id="three"></div>
                <div class="song" id="four"></div>
                <div class="song" id="five"></div>
            </div>
            <div class="play">
                <i class="fa-solid fa-play"></i><i class="fa-solid fa-pause"></i><i class="fa-solid fa-stop"></i>
                <div class="lyrics">어떻게 너를 잊어 어떻게 너를 잊어 내가
                    좋았던 기억이 내 안에 아직 남아서
                    마음 깊이 스며 있는데널 몰랐다면 사랑하지 않았다면
                    이렇게 나 힘들었을까 난 절대 널 못 잊어</div>
            </div>
        </div>
    </div> 
    <div class="list">
            <div class="subwrapper">
            <div class="menu">
            <button>실시간 차트</button><button>신곡</button><button>추천 곡</button><button>MyList</button><button>연령별</button>
            </div>
        
            
                <div class="chart">
                    
                </div>
           </div>
        </div>

</div> 
    )
}

export default Player