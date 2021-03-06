/****************************************************************************
**
** Copyright (C) 2016 Paul Lemire <paul.lemire350@gmail.com>
**
** This file is part of the Qt3D Profiler
**
** $QT_BEGIN_LICENSE:GPL-QTAS$
** Commercial License Usage
** Licensees holding valid commercial Qt Automotive Suite licenses may use
** this file in accordance with the commercial license agreement provided
** with the Software or, alternatively, in accordance with the terms
** contained in a written agreement between you and The Qt Company.  For
** licensing terms and conditions see https://www.qt.io/terms-conditions.
** For further information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
** SPDX-License-Identifier: GPL-3.0
**
****************************************************************************/

import QtQuick 2.5
import Profiler 1.0

Item {
    id: root
    property int type
    property int start
    property int end
    property int relativeStart
    property int relativeEnd
    property real duration
    property int instance
    property color color
    property alias name: nameDisplayer.text

    width: childrenRect.width
    height: childrenRect.height

    opacity: visible ? 1 : 0
    Behavior on opacity { OpacityAnimator { duration: 750; easing.type: Easing.InBack } }

    Rectangle {
        gradient: Gradient {
            GradientStop { color: root.color; position: 0.0}
            GradientStop { color: Qt.darker(root.color, 1.25); position: 1.0}
        }
        border {
            width: 1
            color: "black"
        }
        anchors.fill: infoGrid
        anchors.margins: -10
    }

    Grid {
        id: infoGrid
        columns: 2
        spacing: 5
        Text {
            color: "white"
            text: "Type: "
        }
        Text {
            id: nameDisplayer
            color: "white"
            text: name
        }
        Text {
            color: "white"
            text: "Instance: "
        }
        Text {
            color: "white"
            text: instance
        }
        Text {
            color: "white"
            text: "Start (global): "
        }
        Text {
            color: "white"
            text: start + " ns"
        }
        Text {
            color: "white"
            text: "End (global): "
        }
        Text {
            color: "white"
            text: end + " ns"
        }
        Text {
            color: "white"
            text: "Start (relative): "
        }
        Text {
            color: "white"
            text: relativeStart + " ns"
        }
        Text {
            color: "white"
            text: "End (relative): "
        }
        Text {
            color: "white"
            text: relativeEnd + " ns"
        }
        Text {
            color: "white"
            text: "Duration: "
        }
        Text {
            color: "white"
            text: duration.toFixed(4) + " ms"
        }
    }
}
