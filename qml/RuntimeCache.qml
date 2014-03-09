/*
    Copyright (c) 2014 Oleg Linkin <MaledictusDeMagog@gmail.com>

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
*/


import QtQuick 2.0

Item {
    id: runtimeCache

    property var itemsObject: new Object()

    function addItem (item) {
        var data = new Object;
        for (var key in item) {
            data [key] = item [key]
        }
        itemsObject[item.uid] = data
    }

    function getItems (type){
        var array = new Array;
        for (var key in itemsObject) {
            if ((type === "read" && itemsObject[key].read === true) ||
                    (type === "favorite" && itemsObject[key].favorite === true) ||
                    (type === "unread" && itemsObject[key].read !== true) ||
                    type === "all")
                array.push (itemsObject [key])
        }
        array.sort (function (a, b) { return b.addedTime - a.addedTime })
        return array
    }

    function removeItem (id) {
        delete itemsObject[id]
    }
}