//Burak Yildirim, 72849, byildirim19
#include <stdio.h>
#include <string.h>
#include <math.h>
int main(void) {
    //initialize necessary variables
    char findWord[30];
    char wordList[44][30];
    int positiveArr[44]={0};
    int negativeArr[44]={0};
    int posIndex,negIndex=0;
    int timeAppear,totalScore=0;
    int s;
    float averageScore;
    //take input from user
    printf("Enter a word: ");
    scanf("%s",findWord);
    //opening files
    FILE *fp = fopen("movieReviews.txt","r");
    FILE *fp2 = fopen("wordList.txt","r");
    //check files
    if(fp==NULL || fp2 == NULL){
        perror("Can't open files.");
    }
    int ct = 0;
    //store the wordlist in array
    char words[500];
    while(fgets(words,sizeof(words),fp2)!=NULL){
	//split words using string tokenizer with delimeter " \r"
        char *wordptr = strtok(words,"\r");
	while(wordptr!=NULL){
	    strcpy(wordList[ct],wordptr);
	    ct++;
	    wordptr = strtok(NULL,"\r");
	}     
    }
    //in order to remove \n char from the last word in the wordlist.txt
    wordList[43][strlen(wordList[43])-1] = '\0';
    char line[300];
    while(fgets(line,sizeof(line),fp)!=NULL){
	//split line using string tokenizer with delimeter " "
        char *ptr = strtok(line," ");
        char strArr[100][50];
        int i = 0;
        int wordFound=0;
        int j;
 	int k;
        int wordsFound[44]={0};
        while(ptr!=NULL){
	    //store the words in the line to strArr
            strcpy(strArr[i],ptr);
            i++;
	    //check whether user's word and current word equal or not
            if(!strcasecmp(findWord,ptr)){
		if(!wordFound){
		    timeAppear++;
		    totalScore+=atoi(strArr[0]);
		}
		wordFound++;
            }
            ptr = strtok(NULL," ");
        }
	//iterate over all wordlist items and compare them with the words in the line
        for(j=1;j<i;j++){
	    for(k=0;k<44;k++){
	        if(!strcasecmp(wordList[k],strArr[j])){
		    if(!wordsFound[k]){
			if(atoi(strArr[0])>2){
			    positiveArr[k]++;
			}else{
			    negativeArr[k]++;
			}
		    }
		    wordsFound[k]++;
                }
	    }
        }   
    }
    //calculate avg score, if time appearance is 0 then make avg score 0
    averageScore = (float)totalScore/timeAppear;
    if(timeAppear==0){
	averageScore=0;
    }

    //this loop is used for finding the index of words with most occurence in botharrays
    for(s=0;s<44;s++){
	if(positiveArr[s]==max_of_numbers(positiveArr,44)){
	    posIndex=s;
	}
	if(negativeArr[s]==max_of_numbers(negativeArr,44)){
	    negIndex=s;
	}
    }

    printf("%s appears %d times.",findWord,timeAppear);
    printf("\nThe average score for reviews containing the word %s is %0.4f\n",findWord,averageScore);
    printf("The most occuring word in positive reviews is %s with occurence of %d\n",wordList[posIndex],max_of_numbers(positiveArr,44));
    printf("The most occuring word in negative reviews is %s with occurence of %d\n",wordList[negIndex],max_of_numbers(negativeArr,44));

    //closing the files
    fclose(fp);
    fclose(fp2);

    return 0;
}

//function defined for find the max number in int array
int max_of_numbers(int *array, int count) {
    int i;
    //found by iterating over all elements and store the max element in array[0]
    for(i = 0; i<count; i++){
        if(array[0]<array[i]){
 	    array[0]=array[i];
        }
    }
    return array[0];
}


