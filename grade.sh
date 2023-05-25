CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f "student-submission/ListExamples.java" ]]
then
    echo "ListExamples.java Found!"
    else 
        echo "ListExamples.java NOT Found!"
        echo "Score: 0/4"
        exit
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# it should have ListExamples.java and TestListExamples.java in the directory

# Then, add here code to compile and run, and do any post-processing of the
# tests


javac -cp  ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" grading-area/*.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples #> junit-output.txt

# FAILURES = grep "Failures:" junit-output.txt  
