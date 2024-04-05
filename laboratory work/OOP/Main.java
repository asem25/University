

import java.io.*;
import java.util.*;


public class homework {
    //объявление шаблонов
    private static final String[] units = { "", "один", "два", "три", "четыре",
            "пять", "шесть", "семь", "восемь", "девять", "десять",
            "одиннадцать", "двенадцать", "тринадцать", "четырнадцать",
            "пятнадцать", "шестнадцать", "семнадцать", "восемнадцать", "девятнадцать" };
    private static final String[] thousands = { "", "тысяча", "тысячи", "тысяч" };
    private static final String[] hundreds = {
            "",
            "сто",
            "двести",
            "триста",
            "четыреста",
            "пятьсот",
            "шестьсот",
            "семьсот",
            "восемьсот",
            "девятьсот"
    };
    private static final String[] tens = {
            "",        // 0
            "",        // 1
            "двадцать",  // 2
            "тридцать",  // 3
            "сорок",   // 4
            "пятьдесят", // 5
            "шестьдесят",  // 6
            "семьдесят", // 7
            "восемьдесят", // 8
            "девяносто"   // 9
    };
    // Исполняющий метод 
    public static void main(String[] args) throws IOException {
        // Объявление объекта, который читает из консоли
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        // чтение строки из консоли
        String frombuf = reader.readLine();

        // проверка на пустую строку
        if (!frombuf.isEmpty()) {
                //приведение к int
                Integer intFromConsole = Integer.parseInt(frombuf);
                
            if (intFromConsole < 10000){
                    logger(intFromConsole);
            }else
                System.out.println(convert(intFromConsole));
        }
    }
    private static void logger(int numb){
        System.out.println(String.format("Было введено %d-значное число", String.valueOf(numb).length()));
    }
    //Метод обработки
    public static String convert(int number) {
        // для упрощения реализации использовал рекурсию
        // использовал тернарный оператор, чтобы избежать огромного кол-ов if-else
        // формула для тернарного оператора : bool expression ?  true : false
        if (number < 0) {
            return "минус " + convert(-number);
        }
        if (number < 20) {
            return units[number];
        }
        if (number < 100) {
            return tens[number / 10] + ((number % 10 != 0) ? " " + units[number % 10] : "");
        }
        if (number < 1000) {
            return hundreds[number / 100] + ((number % 100 != 0) ? " " + convert(number % 100) : "");
        }
        if (number < 10000) {
            String thousandsPart = (number / 1000 == 1 && number % 1000 != 0) ? "одна тысяча" :
                    (number / 1000 == 2) ? "две тысячи" :
                            (number / 1000 >= 5) ? units[number / 1000] + " " + thousands[3] :
                                    units[number / 1000] + " " + thousands[1 + number % 10];
            String rest = number % 1000 != 0 ? " " + convert(number % 1000) : "";
            return thousandsPart + rest;
        }
        if (number < 100000) {
            if (number % 10000 != 0) {
                int i = 1 + (number / 1000) % 10 == 1 ? 1 : 1 + (number / 1000) % 10 == 2 ? 2
                        : ((number / 1000) % 10 > 2) & ((number / 1000) % 10) <= 4 ? 2 : 3; 

                String thousandsPart = convert(number / 1000) + " " + thousands[i];
                thousandsPart = thousandsPart.replaceAll("два тысяч", "две тыcячи");
                thousandsPart = thousandsPart.replaceAll("один тысячи", "одна тысяча");
                String rest = number % 1000 != 0 ? " " + convert(number % 1000) : "";
                return thousandsPart + rest;
            } else {
                return convert(number / 1000) + " " + thousands[3];
            }
        }
        return "number < 100000 is false";
    }


}


