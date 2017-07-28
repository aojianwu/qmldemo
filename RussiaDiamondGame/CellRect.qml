import QtQuick 2.0
Image{
    Global{
        id:global
    }

    id:root
    property int image_index: -1
    width: global.cellWidth
    height: global.cellHeight
    source:getImage(image_index)
    property int cur_shape: -1

    function getPos(arr,pos)
    {
        var resultStr = "";
        var jishu = 0;
        var mask = 0x80;
        for(var i =0;i<2;i++)
        {
            mask = 0x80;
            for(var j =0;j<8;j++)
            {
                //                if(j%4 ==0&&j!=0)
                //                {
                if(arr[i] & mask)
                {
                    jishu = jishu+1;
                    if(jishu === pos)
                    {
                        if(i===0&&j<=3)
                        {
                            resultStr = i+"-"+j;
                        }
                        else if(i===0&&j>3)
                        {
                            resultStr = 1+"-"+(j-4);
                        }
                        else if(i===1&&j<=3)
                        {
                            resultStr = 2+"-"+j;
                        }
                        else if(i===1&&j>3)
                        {
                            resultStr = 3+"-"+(j-4);
                        }
                    }
                }
                // }
                mask = mask/2;
            }
        }
        return resultStr;
    }

    function getImage(index)
    {
        var str= "";
        switch(index)
        {
        case 1:
            str = "./images/001.gif" ;
            break;
        case 2:
            str = "./images/002.gif" ;
            break;
        case 3:
            str = "./images/003.gif" ;
            break;
        case 4:
            str = "./images/004.gif" ;
            break;
        case 5:
            str = "./images/005.gif" ;
            break;
        default:
            str = "" ;
            break;
        }
        return str;
    }
}
