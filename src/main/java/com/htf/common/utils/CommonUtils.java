package com.htf.common.utils;

import com.google.common.base.Joiner;
import com.htf.common.config.security.model.AuthUser;
import com.htf.controller.vo.request.PageBaseRequest;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @author acumes
 * @date 2018/8/10 16:27
 */
public class CommonUtils {

    public static void pageRequest(Object o){
        PageBaseRequest pageBaseRequest = (PageBaseRequest) o;
        if(pageBaseRequest.getPageNo() == null || pageBaseRequest.getPageNo() == 0){
            pageBaseRequest.setPageNo(1);
        }
        if(pageBaseRequest.getPageSize() == null || pageBaseRequest.getPageSize() == 0){
            pageBaseRequest.setPageSize(10);
        }
        if(pageBaseRequest.getPageSize() > 100){
            pageBaseRequest.setPageSize(50);
        }
    }

    public static AuthUser getCurrentUser(){
        AuthUser authUser = (AuthUser) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        return authUser;
    }

    /*
     * 将时间转换为时间戳
     */
    public static String dateToStamp(String s) throws ParseException {
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(s);
        long ts = date.getTime();
        res = String.valueOf(ts);
        return res;
    }

    /**
     * 将当前时间转为时间戳，毫秒级
     */
    public static String dateToStampM() throws ParseException {
        String res;
        String str = DateUtils.getNowDateMillisecond();
        Date date = DateUtils.getDateMillisecond(str);
        long ts = date.getTime();
        res = String.valueOf(ts);
        return res;
    }

    /*
     * 将时间戳转换为时间
     */
    public static String stampToDate(String s) {
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }

    /**
     * 目前只考虑Windows和Linux两种
     *
     * @return
     */
    public static boolean isWindows() {
        if (System.getProperties().getProperty("os.name").toUpperCase().indexOf("WINDOWS") != -1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 获得格式化时间
     * 取字符串
     */
    public static String getDateFormat() {
        Date nowTime = new Date();
        SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
        return time.format(nowTime);
    }

    /**
     * 将数组转为List
     */
    public static List<String> arrayConvertList(String[] array) {
        List<String> list = new ArrayList<String>();
        for (int i = 0; i < array.length; i++) {
            list.add(array[i]);
        }
        return list;
    }

    /**
     * 校验字符串是不是一个合法的日期格式
     */
    public static boolean isValidDate(String str) {
        boolean convertSuccess = true;
        // 指定日期格式为四位年/两位月份/两位日期，注意yyyy/MM/dd区分大小写；
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        try {
            // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
            format.setLenient(false);
            format.parse(str);
        } catch (ParseException e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            convertSuccess = false;
        }
        return convertSuccess;
    }

    /**
     * 校验字符串是不是一个合法的日期格式+格式化方式
     */
    public static boolean isValidDate(String str, String style) {
        boolean convertSuccess = true;
        // 指定日期格式为四位年/两位月份/两位日期，注意yyyy/MM/dd区分大小写；
        SimpleDateFormat format = new SimpleDateFormat(style);
        try {
            // 设置lenient为false. 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
            format.setLenient(false);
            format.parse(str);
        } catch (ParseException e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            convertSuccess = false;
        }
        return convertSuccess;
    }

    /**
     * 判断日期是否冲突
     *
     * @param validDateTarget
     * @param invalidDateTarget
     * @param validDate
     * @param invalidDate
     * @return
     */
    public static boolean isDateConflict(String style, Date validDateTarget, Date invalidDateTarget, Date validDate, Date invalidDate) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(style);
        boolean after = validDate.after(invalidDateTarget);
        boolean before = invalidDate.before(validDateTarget);
        boolean equals = simpleDateFormat.format(validDateTarget).equals(simpleDateFormat.format(invalidDate));
        boolean equals1 = simpleDateFormat.format(invalidDateTarget).equals(simpleDateFormat.format(validDate));
        System.err.println(after + "" + before + "" + equals + "" + equals1);
        return !(validDate.after(invalidDateTarget)
                || invalidDate.before(validDateTarget)
                || simpleDateFormat.format(validDateTarget).equals(simpleDateFormat.format(invalidDate))
                || simpleDateFormat.format(invalidDateTarget).equals(simpleDateFormat.format(validDate)));
    }

    /**
     * 校验是不是数字
     * ([1-9]+[0-9]*|0)(\\.[\\d]+)?
     * 只能输入整数或者两位小数点以内的数字
     */
    public static boolean isNumber(String str) {
        String reg = "^[1-9][0-9]*(\\.[0-9]{1," + 2 + "})?$";
        Pattern pattern = Pattern.compile(reg);
        return pattern.matcher(str).matches();
    }

    public static boolean isIngeterNumber(String str) {
        String reg = "^[-\\+]?[\\d]*$";
        Pattern pattern = Pattern.compile(reg);
        return pattern.matcher(str).matches();
    }

    /**
     * 校验只能是正整数
     *
     * @param str
     * @return
     */
    public static boolean isPositiveIngeterNumber(String str) {
        String reg = "^[+]?[\\d]*$";
        Pattern pattern = Pattern.compile(reg);
        return pattern.matcher(str).matches();
    }

    public static boolean isEffectiveNumbers(String str) {
        String reg = "^[0-9]\\d{0,7}(\\.\\d{1,2}?)$|^[0-9]\\d{0,7}$";
        return Pattern.compile(reg).matcher(str.toString()).find();
    }

    /**
     * 创建缓存code
     *
     * @param systemName
     * @param moduleName
     * @param attrname
     * @return
     */
    public static String createCacheCode(String systemName, String moduleName, String attrname) {
        String code = Joiner.on("-").join(systemName, moduleName, attrname);
        return code;
    }

    /**
     * empty to Null
     *
     * @param obj
     * @return
     */
    public static String empty2Null(Object obj) {
        if (isEmpty(obj)) {
            return null;
        }
        return null2String(obj);
    }

    /**
     * 判断空
     *
     * @Author wsw
     * @params
     * @createDate 下午2:07:04
     */
    public static boolean isEmpty(Object obj) {
        if (null == obj) {
            return true;
        } else {
            if (obj instanceof String) {
                return "".equals(null2String(obj))
                        || "null".equals(null2String(obj));
            } else if (obj instanceof Collection) {
                return ((Collection) obj).isEmpty();
            } else if (obj instanceof Map) {
                return ((Map) obj).isEmpty();
            } else if (obj instanceof Object[]) {
                return ((Object[]) obj).length == 0;
            } else {
                return false;
            }
        }
    }

    /**
     * 对象转换成字符串
     *
     * @Author wsw
     * @params
     * @createDate 下午2:06:47
     */
    public static String null2String(Object obj) {
        if (null == obj || "".equals(((String) obj).trim()) || "null".equals(((String) obj).trim())) {
            return "";
        }
        return obj.toString().trim();
    }

    /**
     * 随机生成32位随机码
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
    }

    /**
     * 后台打印日志处理
     */
    public static String getLogStr(String error) {
        return String.format("当前时间 : %s , 日志:  -> %s", DateUtils.getStringDate(), error);
    }

    /**
     * 生成随机数字和字母
     *
     * @param length
     * @return
     */
    public static String getStringRandom(int length) {
        String val = "";
        Random random = new Random();
        length = random.nextInt(length);
        if (length < 10) {
            length = 10;
        }
        //参数length，表示生成几位随机数
        for (int i = 0; i < length; i++) {

            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                //输出是大写字母还是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                int t = random.nextInt(27);
                if (t == 26) {
                    val += '-';
                } else {
                    val += (char) (t + temp);
                }
            } else if ("num".equalsIgnoreCase(charOrNum)) {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }


    /**
     * 判断模板是否正确,目前只涉及到拿第一个工作簿进行判别
     */
//    public static boolean judgeTemplate(String filePathName, String templateType) {
//        Workbook wb;
//        InputStream inputStream = null;
//        try {
//            inputStream = new FileInputStream(filePathName);
//            if (WDWUtil.isExcel2003(filePathName)) {
//                wb = new HSSFWorkbook(inputStream);
//            } else {
//                wb = new XSSFWorkbook(inputStream);
//            }
//            Sheet sheet = wb.getSheetAt(0);  //第一个工作簿
//            String sheetName = sheet.getSheetName();
//            if (!sheetName.equals(templateType)) {
//                return false;
//            }
//        } catch (IOException e) {
//            log.info(CommonUtils.getLogStr("excel不存在，可能被删除了!或者excel格式不对"));
//            return false;
//        } finally {
//            if (inputStream != null) {
//                try {
//                    inputStream.close();
//                } catch (IOException e) {
//                    log.info(CommonUtils.getLogStr("关闭文件流失败!"));
//                    return false;
//                }
//            }
//        }
//        return true;
//    }

    /**
     * 多个模板进行判别主要是针对同一种导入，需要支持货品编号和名称+规格型号
     */
//    public static Map<String, Object> judgeManyTemplate(String filePathName, Map<String, String> templateTypeMap) {
//        Map<String, Object> map = new HashMap<String, Object>();
//        Workbook wb;
//        InputStream inputStream = null;
//        try {
//            inputStream = new FileInputStream(filePathName);
//            if (WDWUtil.isExcel2003(filePathName)) {
//                wb = new HSSFWorkbook(inputStream);
//            } else {
//                wb = new XSSFWorkbook(inputStream);
//            }
//            Sheet sheet = wb.getSheetAt(0);  //第一个工作簿
//            String sheetName = sheet.getSheetName();
//            for (String key : templateTypeMap.keySet()) {
//                if (sheetName.equals(templateTypeMap.get(key))) {
//                    map.put("flag", true);
//                    map.put("templateType", templateTypeMap.get(key));
//                    return map;
//                }
//            }
//            map.put("flag", false);
//            return map;
//        } catch (IOException e) {
//            log.info(CommonUtils.getLogStr("excel不存在，可能被删除了!或者excel格式不对"));
//            map.put("flag", false);
//        } finally {
//            if (inputStream != null) {
//                try {
//                    inputStream.close();
//                } catch (IOException e) {
//                    log.info(CommonUtils.getLogStr("关闭文件流失败!"));
//                    map.put("flag", false);
//                }
//            }
//        }
//
//        return map;
//    }

    /**
     * 驼峰命名改成下划线命名
     *
     * @param para
     * @return
     */
    public static String HumpToUnderline(String para) {
        StringBuilder sb = new StringBuilder(para);
        int temp = 0;
        for (int i = 0; i < para.length(); i++) {
            if (Character.isUpperCase(para.charAt(i))) {
                sb.insert(i + temp, "_");
                temp += 1;
            }
        }
        return sb.toString().toLowerCase();
    }

    /**
     * 判断字符串是否包含数字或者英文字母
     *
     * @param str
     * @return
     */
    public static boolean isNumberOrLetter(String str) {
        String regEx = "[a-zA-Z0-9\\\\-]+?";
        Pattern pattern = Pattern.compile(regEx);
        return pattern.matcher(str).matches();
    }

    /**
     * 从缓存中取基础数据
     */
//    public static Object getBasicDataByCache(String type) {
//        return getCacheMap(CommonConstants.CDM_WEB, type, CommonStatusConstants.IDNAME);
//    }

//    public static Object getCacheMap(String systemName, String moduleName, String attrname) {
//        String code = CommonUtils.createCacheCode(systemName, moduleName, attrname);
//        CacheTarget cacheTarget = createCacheTarget(code);
//        return CacheHelper.get(cacheTarget);
//    }
//
//    public static CacheTarget createCacheTarget(String code) {
//        CacheTarget cacheTarget = CacheTarget.create(code);
//        return cacheTarget;
//    }

}
