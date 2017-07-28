import QtQuick 2.0
QtObject{
    property var tableArr: null
    Component.onCompleted: {

        console.log("---------------")
        tableArr = new Array(global.rowCount);
        for(var i =0;i<global.rowCount;i++)
        {
            tableArr[i] = new Array(global.colCount);
        }
        for(var i =0;i<global.rowCount;i++)
        {
            for(var j =0;j<global.colCount;j++)
            {
                tableArr[i][j] = null;
            }
        }
        // global.createShape(18,0,0);
    }
}
