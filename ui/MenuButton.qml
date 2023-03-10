// SPDX-FileCopyrightText: 2021 Aditya Mehra <aix.m@outlook.com>
//
// SPDX-License-Identifier: Apache-2.0

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Templates 2.12 as QQCT
import org.kde.kirigami 2.11 as Kirigami

QQCT.Button {
    id: menuBtn

    readonly property Flickable listView: {
        var candidate = parent;
        while (candidate) {
            if (candidate instanceof Flickable) {
                return candidate;
            }
            candidate = candidate.parent;
        }
        return null;
    }

    width: listView.width
    height: Kirigami.Units.gridUnit * 3
    property alias iconSource: menuBtnIcon.source

    background: Rectangle {
        color: menuBtn.activeFocus ? Kirigami.Theme.highlightColor : Kirigami.Theme.backgroundColor
        radius: 6
    }

    contentItem: RowLayout {
        Kirigami.Icon {
            id: menuBtnIcon
            Layout.preferredWidth: Kirigami.Units.iconSizes.medium
            Layout.preferredHeight: Kirigami.Units.iconSizes.medium
        }

        QQCT.Label {
            id: menuBtnText
            text: menuBtn.text
            color: Kirigami.Theme.textColor
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
    }

    Keys.onReturnPressed: {
        clicked()
    }
 }
