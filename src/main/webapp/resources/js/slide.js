var counter = 0;

hs.graphicsDir = '/resources/images/graphics/';     // путь к оформлению
hs.transitions = ['expand'];                  // способ смены слайдов, может принимать значения: expand, fade, crossfade. А также может иметь вид hs.transitions = ['expand/fade','expand/fade/crossfade'], где первый параметр — стиль появления слайда, второй стиль смены слайдов
hs.fadeInOut = true;                          // "затухание" при открыти/закрытии слайдшоу
hs.numberPosition = 'caption';                // счетчик может принимать значение caption и heading, что соответствует позиции вверху/внизу
hs.dimmingOpacity = 0.75;                     // прозрачность фона
hs.align = 'auto';                            // расположение слайда относительно экрана, возможные значения center/left/right/top/bottom, а так же их комбинации в парах, если auto — распологается на своём месте

// добавляем блок навигации (стандартный)

if (hs.addSlideshow) hs.addSlideshow({

    interval: 5000,                       // интервал смен в милисеках
    repeat: false,                        // повторять/не повторять
    useControls: true,                    // использовать ли кнопки навигации?
    overlayOptions: {
        opacity: .6,                  // прозрачность панели навигации
        position: 'bottom center',     // позиция панели навигации
        hideOnMouseOut: true          // панель спрячется, если убрать курсор мыши со слайда
    }
});


