/*!
 * FileInput Spanish (Latin American) Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";
    $.fn.fileinput.locales.es = {
    		fileSingle: '单个文件',
            filePlural: '多个文件',
            browseLabel: '选择文件 &hellip;',
            removeLabel: '删除文件',
            removeTitle: '删除选中文件',
            cancelLabel: '取消',
            cancelTitle: '取消上传',
            uploadLabel: '上传',
            uploadTitle: '上传选中文件',
            msgSizeTooLarge: '文件 "{name}" (<b>{size} KB</b>) 超过文件大小限制 <b>{maxSize} KB</b>. 请重新上传!',
            msgFilesTooLess: '文件数量必须大于 <b>{n}</b> {files}，请重新上传！',
            msgFilesTooMany: '选择上传的文件数为<b>({n})</b>  超过最大文件限度<b>{m}</b>. 请重新上传!',
            msgFileNotFound: '文件 "{name}" 未找到!',
            msgFileSecured: '安全限制防止读取文件 "{name}".',
            msgFileNotReadable: '不能读取 "{name}" 文件.',
            msgFilePreviewAborted: '预览 "{name}" 文件中止.',
            msgFilePreviewError: '读取 "{name}" 文件出错.',
            msgInvalidFileType: ' "{name} 文件无效". 仅支持 "{types}" 类型文件上传.',
            msgInvalidFileExtension: '无效的 "{name}" 扩展文件. 仅支持 "{extensions}" 文件上传.',
            msgValidationError: '文件上传失败',
            msgLoading: '加载文件 {index} / {files} &hellip;',
            msgProgress: '加载文件 {index} / {files} - {name} - {percent}%.',
            msgSelected: '选中{n}个文件',
            msgFoldersNotAllowed: '拖放文件有 {n} 个目录被跳过.',
            dropZoneTitle: '拖放文件到这里 &hellip;'
    };

    $.extend($.fn.fileinput.defaults, $.fn.fileinput.locales.es);
})(window.jQuery);
