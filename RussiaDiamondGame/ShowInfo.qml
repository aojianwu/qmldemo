//文本区
import QtQuick 2.0

Rectangle{
    property int text_num: 0
    width: global.cellWidth*10
    height: global.cellHeight*8
    Column{
        spacing: 10
        Text{
            id:tt
            text:"当前得分:"+text_num
            font.family: "微软雅黑"
            font.pixelSize: 20
            color: "green"
            anchors.left: parent.left
            y:global.cellHeight
        }
        Text {
            id: shuoming
            text: qsTr("说明:向上键用于旋转")
            color: "red"
            font.family: "微软雅黑"
            font.pixelSize: 15

        }
        Text {
            id: jieshu
            text: qsTr("游戏结束!!!")
            color: "red"
            font.family: "微软雅黑"
            font.pixelSize: 20
            visible: global.isJieShu
        }
    }
}
