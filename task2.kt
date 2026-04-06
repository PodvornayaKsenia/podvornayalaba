import java.io.File

fun main() {
    print("Введите строку с кольцами: ")
    val rings = readLine() ?: ""

    /*
    val fin = File("input.txt").bufferedReader()
    val rings = fin.readLine()
    val fout = File("output.txt").printWriter()
    */

    val sterchen = Array(10) { mutableSetOf<Char>() }

    for (i in rings.indices step 2) {
        val color = rings[i]
        val sterchen_num = rings[i+1].digitToInt()
        sterchen[sterchen_num].add(color)
    }

    val result = (0..9).filter { sterchen[it].containsAll(setOf('R', 'G', 'B')) }

    println("${result.size}${result.joinToString(" ", " ")}")

    /*
    fout.println("${result.size}${result.joinToString(" ", " ")}")
    fin.close()
    fout.close()
    */
}
