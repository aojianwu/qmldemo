import QtQuick 2.5
import QtQuick.Controls 1.4
/*
    实际使用中应根据获取或计算得到的电池电量来动态显示，这里使用定时器模拟
*/
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("battery")

    //电池电量(状态位)，0表示电量不足，1表示剩余一半，2表示满电
    property int battery_power: 0
    //显示剩余电量百分比
    property int power_percent: 0
    //显示电压
    property int battery_voltage: 0

    Timer{
        id: timer
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            battery_power = battery_power + 1
            if(battery_power > 2)
            {
                battery_power = 0
            }
        }
    }

    //方法1
    Connections{
        target: timer
        onTriggered:{
            if(battery_power == 0)
            {
                img.source = "pic/none.ico"
            }
            else if(battery_power == 1)
            {
                img.source = "pic/half.ico"
            }
            else
            {
                img.source = "pic/full.ico"
            }
        }
    }

    //方法2
    Connections{
        target: timer
        onTriggered:{
            if(powerRect1.width < 100)
            {
                powerRect1.width += 10
            }
            else
            {
                powerRect1.width = 0
            }
            power_percent = powerRect1.width
        }
    }

    //方法3
    Connections{
        target: timer
        onTriggered:{
            if(power_percent < 100)
            {
                power_percent += 10
            }
            else
            {
                power_percent = 0
            }
        }
    }

    //方法4
    Connections{
        target: timer
        onTriggered:{
            if(powerRect4.width < 170)
            {
                powerRect4.width += 17
            }
            else
            {
                powerRect4.width = 0
            }

            if(powerRect4.width <= 34)
            {
                powerRect4.color = "red"
            }
            else
            {
                powerRect4.color = "green"
            }

            if(battery_voltage < 20)
            {
                battery_voltage += 2
            }
            else
            {
                battery_voltage = 0
            }
        }
    }

    Grid{
        anchors.fill: parent
        columns: 2

        //方法1：切图片
        Rectangle{
            width: parent.width/2
            height: parent.height/2

            Image {
                id: img
                anchors.centerIn: parent
                width: 128
                height: 73
                source: "pic/none.ico"
            }
        }

        //方法2：自定义
        Rectangle{
            width: parent.width/2
            height: parent.height/2

            Rectangle{
                id: batteryRect1
                anchors.centerIn: parent
                width: 120
                height: 60
                radius: 5
                border.width: 8
                border.color: "lightgray"

                Rectangle{
                    id: powerRect1
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    width: 0
                    height: 40
                    gradient: Gradient
                    {
                        GradientStop { position: 0.0; color: "green" }
                        GradientStop { position: 1.0; color: "lightgreen" }
                    }
                }
            }
            Rectangle{
                anchors.left: batteryRect1.right
                width: 12
                height: 24
                radius: 1
                y: parent.height/2 - 12

                color: "lightgray"
            }
        }

        //方法3：自定义，显示数字
        Rectangle{
            width: parent.width/2
            height: parent.height/2

            Rectangle{
                id: batteryRect2
                anchors.centerIn: parent
                width: 120
                height: 60
                radius: 5
                color: "lightgray"

                Label{
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    font.family: "微软雅黑"
                    text: power_percent.toString() + "%"
                }
            }
            Rectangle{
                anchors.left: batteryRect2.right
                width: 12
                height: 24
                radius: 1
                y: parent.height/2 - 12

                color: "lightgray"
            }
        }

        //方法4：显示电量，电压和可用时间
        Rectangle{
            width: parent.width/2
            height: parent.height/2

            Rectangle{
                id: batteryRect3
                anchors.centerIn: parent
                width: 200
                height: 90
                radius: 5
                border.width: 8
                border.color: "lightgray"

                Rectangle{
                    id: powerRect3
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    width: 180
                    height: 70
                    color: "black"

                    Rectangle{
                        id: powerRect4
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        radius: 2
                        width: 0
                        height: 60
                        color: "green"
                    }
                }

                /*左侧百分百*/
                Text{
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    anchors.top: parent.top
                    anchors.topMargin: 25
                    width: 50
                    height: 50
                    font.family: "微软雅黑"
                    font.pixelSize: 25
                    color: "white"
                    text: power_percent.toString() + "%"
                }
                /*分隔线*/
                Rectangle{
                    id: lineRect
                    anchors.centerIn: parent
                    height: 50
                    width: 1
                    color: "white"
                }
                /*右上剩余时间*/
                Text{
                    anchors.left: lineRect.right
                    anchors.leftMargin: 5
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    width: 40
                    height: 20
                    font.family: "微软雅黑"
                    font.pixelSize: 10
                    color: "white"
                    text: "Consump" + "~" + power_percent.toString() + "sce"
                }
                /*右下电压*/
                Text{
                    anchors.left: lineRect.right
                    anchors.leftMargin: 35
                    anchors.top: parent.top
                    anchors.topMargin: 40
                    width: 30
                    font.family: "微软雅黑"
                    font.pixelSize: 20
                    color: "white"
                    text: battery_voltage.toString() + "V"
                }

            }
            Rectangle{
                anchors.left: batteryRect3.right
                width: 12
                height: 24
                radius: 1
                y: parent.height/2 - 12

                color: "lightgray"
            }
        }
    }
}
