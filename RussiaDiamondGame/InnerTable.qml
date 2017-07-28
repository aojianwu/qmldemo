import QtQuick 2.0
Canvas{

    id:frame_canvas;
    width:global.cellWidth*global.colCount
    height: global.cellHeight*global.rowCount
    contextType: "2d"
    onPaint: {


        console.log("chongxin............")

        // console.log(test)
        var ctx = getContext("2d");


        ctx.lineWidth = global.tableFrameInnerLineWidth;
        ctx.strokeStyle = global.tableFrameInnerLineColor;
        ctx.fillStyle = global.tableFrameFillColor;

        ctx.beginPath();

        ctx.rect(0,0,frame.width,frame.height);

        ctx.fill();
        ctx.stroke();

        //绘制内线
        ctx.lineWidth = global.tableFrameInnerLineWidth;
        ctx.strokeStyle = global.tableFrameInnerLineColor;
        ctx.beginPath();
        for(var i =0;i<=global.rowCount;i++)
        {
            //            ctx.moveTo(0,i*global.cellHeight);
            //            ctx.lineTo(frame.width,i*global.cellHeight);

            ctx.moveTo(0,i*global.cellHeight);
            ctx.lineTo(frame.width,i*global.cellHeight);
        }
        for(var j =0;j<=global.colCount;j++)
        {
            ctx.moveTo(j*global.cellWidth,0);
            ctx.lineTo(j*global.cellWidth,frame.height);
        }
        console.log("chongxin1............")
        ctx.stroke();
        console.log(global.isGrid)
        if(!global.isGrid)
        {
            console.log("daole..............")
            ctx.clearRect(0,0,frame_canvas.width,frame_canvas.height)

        }
    }

    //   Component.onCompleted:
    //    {
    //        frame_canvas.clearRect(0,0,frame_canvas.width,frame_canvas.height)
    //        frame_canvas.requestPaint();
    //    }


}
