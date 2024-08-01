import ballerina/io;
import ballerina/random;

type st string;

type Course record {
    readonly st code;
    st name;
    int numberOfStudents?;
    st Lecturer;
};

public function main() {
    Course course1 = {
        code: "dsa612s",
        name: "Dist......",
        Lecturer: "Makosa",
        numberOfStudents: 499
    };

    table<Course> key(code) courseTable = table [];
    courseTable.add(course1);
    Course removedCourse = courseTable.remove("dsa");
    io:println(removedCourse);

    Course getCourse = courseTable.get("dsa612s");
    io:println(getCourse);

    int age;
    string name;
    boolean yes;
    float height;
    decimal weight;
    any course = "";
    var distance = 34.8f;

    if course == "DSA" {
        io:println("DSA");
    } else if course == "PRG" {
        io:println("PRG");
    } else {
        io:println("Not DSA");
    }

    match course {
        "DSA"|"dsa" => {
            io:println("DSA");
        }
        23|32 => {
            io:println(23);
        }
    }
    age = 10;
    while age >= 20 {
        io:println("Age ", 20);
        age += 1;
        age = age + 1;
        break;
        // continue;
    }

    int[] marks = [1, 215, 2, 36, 78, 56];

    marks[4] = 50;

    marks.push(67);
    _ = marks.pop();

    foreach int i in marks {
        io:println(i);
    }

    foreach int i in 1 ... 100 {
        io:println(i);
    }

    foreach int i in int:range(1, 100, 2) {
        io:println(i);
    }

    displayStudentDetails();

    float avgMark = calcAVGMark(marks);

    io:println(avgMark);

    int|error randomNumber = random:createIntInRange(10, 60);

    if randomNumber is int {
        io:println("Random Number ", randomNumber);

        foreach int i in 0 ... randomNumber {
            if randomNumber % i == 0 {
                io:print(i, "\t");
            }
        }
    }

    map<int[]> studentAges = {
        "isaac": [86, 98],
        "Makosa": [67, 937]
    };

}

function displayStudentDetails() {
    io:println("Student Details");
}

function calcAVGMark(int[] marks) returns float {
    float total = 0;
    foreach int mark in marks {
        total += <float>mark;
    }
    float avg = total / marks.length();
    return avg;
}

