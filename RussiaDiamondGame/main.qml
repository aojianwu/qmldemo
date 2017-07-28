import QtQuick 2.0
Item{
    id:main_root
    width: global.cellWidth*24
    height: table.height+global.cellHeight*2
    Global{
        id:global
        onGetNewShapeInfo:  {
          //  console.log("curcur"+cur+left+top)

            showNext.creatNextShape(cur,left,top);
        }
    }
    WholeArray{
        id:wholeTableArray
    }

    Rectangle{
        id:table
        width: frame.width+global.tableFrameBorderWidth*2
        height: frame.height+global.tableFrameBorderWidth*2
        border.width: global.tableFrameBorderWidth
        border.color: global.tableFrameBorderColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: global.cellHeight
        anchors.leftMargin: global.cellWidth
        color: "transparent"
        Rectangle{
            width:global.cellWidth*global.colCount
            height: global.cellHeight*global.rowCount
            color: global.tableFrameFillColor
            anchors.centerIn: parent
            visible: global.isZhanWei
        }

        InnerTable{
            id:frame
            anchors.centerIn:  parent
            focus: true
            Keys.enabled: true
            Keys.onPressed: {
                switch(event.key)
                {
                case Qt.Key_Down:
                    if(!global.isJieShu)
                    global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Left:
                    if(!global.isJieShu)
                    global.moveLeft(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Right:
                    if(!global.isJieShu)
                    global.moveRight(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                case Qt.Key_Up:
                    if(!global.isJieShu)
                    global.moveRotate(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount)
                    break;
                }
            }
        }
    }

    ControlButtons{
        id:controlButtons

        anchors.left: table.right
        anchors.leftMargin: global.cellWidth
        anchors.top:  table.top
        //anchors.bottomMargin: global.cellHeight*2
    }
    ShowNext{
        id:showNext
        anchors.top: controlButtons.bottom
        anchors.left: table.right
        anchors.leftMargin: global.cellWidth
        anchors.topMargin: global.cellHeight
    }

    ShowInfo{
        id:showinfo
        anchors.bottom: table.bottom
        anchors.left: table.right
        //anchors.leftMargin: global.cellWidth
        anchors.leftMargin: global.cellWidth
    }





    Timer {
        id:timer_whole
        interval: 500; running: false; repeat: true
        onTriggered:{

            global.moveDown(global.currentShape_index,global.currentShape_leftCount,global.currentShape_topCount);
        }
    }
}
