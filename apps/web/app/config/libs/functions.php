<?php
//DBやdebugの切替
function get_config_name()
{
    //ドメインでConfigを切り替える。
    if (is_included_host(['demo-v5m', 'dev', 'localhost', 'caters', 'test', 'local'])) {
        return 'app_develop';
    }
    return 'app';
}


function is_included_host($targets = array())
{
    foreach ($targets as $target) {
        if (strpos(env('HTTP_HOST'), $target) !== false) {
            return true;
        }
    }
    return false;
}


function is_included_docRoot($targets = array())
{
    foreach ($targets as $target) {
        if (strpos(env('SCRIPT_FILENAME'), $target) !== false) {
            return true;
        }
    }
    return false;
}


function render_text_schedule($start, $end = null)
{
    $days = array('日', '月', '火', '水', '木', '金', '土');
    $txt = $start->format(__('Y年n月j日（{0}）/ G:i　〜　', $days[$start->format('w')]));
    if (!is_null($end)) {
        $txt .= $end->format('Ymd') === $start->format('Ymd') ? $end->format('G:i') : $end->format(__('Y年n月j日（{0}）/ G:i', $days[$end->format('w')]));
    }
    return $txt;
}


function renderBackUrl($param, $default_url = null)
{
    if (!isset($_SERVER['HTTP_REFERER']) || strpos($_SERVER['HTTP_REFERER'], $param) === false) {
        $url = $default_url ? $default_url : __('/{0}', $param);
    } else {
        $url = $_SERVER['HTTP_REFERER'];
    }
    return $url;
}


function icon($str)
{
    if ($str == 'doc' || $str == 'docx') {
        $icon = 'word';
    } elseif ($str == 'xls' || $str == 'xlsx') {
        $icon = 'excel';
    } else {
        $icon = 'pdf';
    }
    return $icon;
}


function html_decode($text)
{
    return html_entity_decode(h($text));
}


function getIDofYTfromURL($url)
{
    preg_match('/^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/', $url, $id, PREG_UNMATCHED_AS_NULL);
    return $id ? $id[1] : null;
}


function getIDofVimeofromURL($url)
{
    preg_match('/^(?:http|https)?:?\/?\/?(?:www\.)?(?:player\.)?vimeo\.com\/(?:channels\/(?:\w+\/)?|groups\/(?:[^\/]*)\/videos\/|video\/|)(\d+)(?:|\/\?)$/', $url, $id, PREG_UNMATCHED_AS_NULL);
    return $id ? $id[1] : null;
}


function is_show($content)
{
    $list_block = \App\Model\Entity\Info::$block_number2key_list;
    $block = isset($list_block[$content->block_type]) ? strtolower($list_block[$content->block_type]) : 'default';

    switch ($block) {
        case 'image':
            $is_show = trim($content->image) === '';
            break;
        case 'h3':
        case 'button':
            $is_show = trim($content->title) === '';
            break;
        case 'memo':
        case 'content':
        case 'video':
            $is_show = trim($content->content) === '';
            break;
        case 'file':
            $is_show = trim($content->file_name) === '';
            break;
        case 'h2':
            $is_show = trim($content->h2) === '';
            break;
        default:
            $is_show = false;
    }

    return $is_show;
}


function human_filesize($bytes, $decimals = 2)
{
    $sz = 'BKMGTP';
    $factor = floor((strlen($bytes) - 1) / 3);
    $s = @$sz[$factor];
    return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . ($s != 'B' ? $s . 'B' : $s);
}


function charlimit($string, $limit)
{
    return mb_substr($string, 0, $limit, 'UTF-8') . (mb_strlen($string, 'UTF-8') > $limit ? "..." : '');
}

function _preventGarbledCharacters($bigText, $width = 249)
{
    $pattern = "/(.{1,{$width}})(?:\\s|$)|(.{{$width}})/uS";
    $replace = '$1$2' . "\n";
    $wrappedText = preg_replace($pattern, $replace, $bigText);
    return $wrappedText;
}
