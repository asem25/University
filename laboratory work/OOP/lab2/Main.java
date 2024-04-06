

import java.io.*;

import java.util.*;


public class Main {

    private static final String string = "\"Я помню чудное мгновенье:\n " +
            "Передо мной явилась ты,\n " +
            "Как мимолетное виденье,\n " +
            "Как гений чистой красоты.\n " +
            "\n" +
            "В томленьях грусти безнадежной,\n В тревогах шумной суеты,\n " +
            "Звучал мне долго голос нежный\n " +
            "И снились милые черты.\n " +
            "\n" +
            "Шли годы. Бурь порыв мятежный\n " +
            "Рассеял прежние мечты,\n " +
            "И я забыл твой голос нежный,\n " +
            "Твои небесные черты.\n " +
            "\n" +
            "В глуши, во мраке заточенья\n " +
            "Тянулись тихо дни мои\n " +
            "Без божества, без вдохновенья,\n " +
            "Без слез, без жизни, без любви.\n " +
            "\n " +
            "Душе настало пробужденье:\n " +
            "И вот опять явилась ты,\n " +
            "Как мимолетное виденье,\n " +
            "Как гений чистой красоты.\n " +
            "\n" +
            "И сердце бьется в упоенье,\n " +
            "И для него воскресли вновь\n " +
            "И божество, и вдохновенье,\n " +
            "И жизнь, и слезы, и любовь.";
    private static final String str = "Это образец текста. Он содержит повторяющиеся слова, такие как образец и текст.";

    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        String s = removeAllSpace(string);

        System.out.println(countWord(s));
    }
    //С помощью элементарных регулярных выражений заменил все множественные пробелы, переводы строк и знаки пунктуация
    private static String removeAllSpace(String s){
        return s.replaceAll("[\\pP]", "").replaceAll("\\n", "").replaceAll("\\s+", " ");
    }
    private static String[] splitString(String s, String splitter){
        return s.split(splitter);
    }
    //TreeMap - словарь на основе красно-черного дерева. По умолчанию хранит данные в порядке возрастания.
    private static TreeMap<String, Integer> countWord(String s){
        TreeMap<String, Integer> map = new TreeMap<>();

        String[] strings = s.split(" ");

        for (String string : strings) {
            if (!map.containsKey(string.toLowerCase())){
                map.put(string.toLowerCase(), 1);
            }else {
                map.put(string.toLowerCase(), map.get(string.toLowerCase()) + 1);
            }
        }
        return map;
    }
}


