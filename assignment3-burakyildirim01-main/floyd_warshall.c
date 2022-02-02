/* This is a code for COMP 201 assignment 3.
 * In this code, Floyd-Warshall algorithm is implemented
 * to find the shortest paths between any two cities
 * in a given graph of cities.
 */
//my code works when there is no empty lines
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int INF = 1e7;  

/* Array of vertices. 
 * Each element of the str array contains a city name and 
 * its index in str becomes the city's numeric id.
 */
typedef struct vertices 
{
	// This attribute shows the size of dynamically allocated memory
	int size;
	// This attribute shows the number of cities in the array
	int city_count;
	// This attribute is the array of city names
	char (* str)[30];
} 
vertices;

/* Array of edges. 
 * Each element of the edge array contains the ids of two cities 
 * connected directy by a road and the length of the road.
 */
typedef struct edges 
{
	// This attribute shows the size of dynamically allocated memory
	int size;
	// This attribute shows the number of roads in the array
	int edge_count;
	// This attribute is the array of road information
	int (* edge)[3];
} 
edges;

vertices cities;

edges roads;

/* A two-dimensional array that shows 
 * the length of the shortest path connecting 
 * any two cities.
 */
int **city_graph;

/* A two-dimensional array that shows the direction 
 * to the shortest path between any two cities.
 */
int **shortest_paths;

/* A function that implements Floyd-Warshall algorithm. 
 * This algorithm finds the shortest path between 
 * any two vertices in a given graph.
 */
void floydWarshall()  
{ 
	int i,j,k; 
	for (k = 0; k < cities.city_count; k++) 
	{  
		for (i = 0; i < cities.city_count; i++) 
		{  
			for (j = 0; j < cities.city_count; j++) 
			{  

				// We cannot cross a road that doesn't exist  
				if ((city_graph[i][k] == INF) || (city_graph[k][j] == INF))  
				{
					continue;
				}  

				if (city_graph[i][j] > (city_graph[i][k] + city_graph[k][j])) 
				{  
					city_graph[i][j] = city_graph[i][k] + city_graph[k][j];  
					shortest_paths[i][j] = shortest_paths[i][k];  
				}  
			}  
		}  
	}  
} 

/* A function that initializes the values in 
 * city_graph and shortest_paths arrays.
 */
void initialise()  
{ 
	int i,j; 
	for (i = 0; i < cities.city_count; i++) 
	{  
		for (j = 0; j < cities.city_count; j++) 
		{    

			// No edge between node i and j  
			if (city_graph[i][j] == INF)  
			{
				shortest_paths[i][j] = -1;
			}  
			else
			{
				shortest_paths[i][j] = j;
			}  
		}  
	}  
}

/* A function that inserts the name of a new city 
 * to the cities array.
 */
int insert_to_cities(char str[30]) 
{
	// Write your code here
	// Check if the city name already exists in the array 
	// If it does, return the array index of the city
	int ind = lookup_string(str);
	// If the city name doesn't exist, it is inserted to the vertex array, and
	// return the array index of the city
	if(ind>=0){
		return ind;
	}
	strcpy(cities.str[cities.city_count],str);
	cities.city_count+=1;
	// If the dynamically allocated size of vertex_array is not large enough, 
	// vertex_array is enlarged and the city name is inserted 
	// to the newly added region
	// Return the array index of the city.
	return cities.city_count - 1;
}

/* A function that looks up if a city name
 * is already in the cities array. 
 */
int lookup_string(char str[30]) 
{
	int i;
	for(i = 0; i < cities.city_count; i++) {
		if(strncmp(str, cities.str[i], 30) == 0)
			return i;
	}
	printf("city %s is not found\n", str);
	return -1;
}

void printPath(int u, int v)  
{  
	// Write your code here
	printf("Output:\n");
	printf("%s ",cities.str[u]);
	int next = shortest_paths[u][v];
	while(next!=v){
		if(next==-1){
			break;
		}
		printf("%s ",cities.str[next]);
		next = shortest_paths[next][v];
	}
	printf("%s\n",cities.str[v]);
} 

int main(int argc, char *argv[])
{
	// Write your code here

	// Allocate memory regions dynamically to vertex array 
	// and edge_array.
	cities.city_count=0;
	roads.size = sizeof(int[3]) * 100;
	cities.size = sizeof(char[30]) * 20;
	roads.edge=malloc(roads.size);
	cities.str=malloc(cities.size);
	// Read and parse the input file. Insert the city names 
	// and ids to vertex_array. 
	// Insert city ids and road lengths to edge_array.
	FILE *fp = fopen("input.txt","r");
	if(fp==NULL){
	    perror("Can't open file.");
	}
	int edge=0;
	int i;
	char line[400];
	while(fgets(line,sizeof(line),fp)){
	    i=0;
	    char *word = strtok(line," ");
	    while(word!=NULL){
	        if(i==0||i==1){
			roads.edge[edge][i]=insert_to_cities(word);
		}else{
			word[strlen(word)-1]='\0';
			roads.edge[edge][i]=atoi(word);
		}
		    i+=1;
		    word=strtok(NULL," ");
	    }
	    edge++;
	} 
	roads.edge_count=edge;
	roads.size=sizeof(int[3])*roads.edge_count;
	roads.edge=realloc(roads.edge,roads.size);

	cities.size=sizeof(char[30])*cities.city_count;
	cities.str=realloc(cities.str,cities.size);

	// Allocate memory regions dynamically to city_graph, 
	// distance, and shortest_paths arrays.
	city_graph = (int **)malloc(cities.city_count*sizeof(int *));
	for(i=0;i<cities.city_count;i++){
		city_graph[i]=(int *)malloc(cities.city_count*sizeof(int));
	}
	shortest_paths = (int **)malloc(cities.city_count*sizeof(int *));
	for(i=0;i<cities.city_count;i++){
		shortest_paths[i]=(int *)malloc(cities.city_count*sizeof(int));
	}	
	// Initialize the values in city_graph array with road lengths, 
	// such that the value in city_graph[i][j] is the road length 
	// between cities i and j if these cities are directly connected 
	// by a road 
	// For cities m and n that are not connected directly by a road, 
	// the value in city_graph[m][n] will be INF, 
        // which is a large value like 10M, 
	// that is assumed to be infinite. 
	
	int k,l,firstInd,secondInd;
	for(k=0;k<cities.city_count;k++){
		for(l=0;l<cities.city_count;l++){
			city_graph[k][l]=INF;
		}
	}
	for(k=0;k<roads.edge_count;k++){
		firstInd=roads.edge[k][0];
		secondInd=roads.edge[k][1];
		city_graph[firstInd][secondInd]=roads.edge[k][2];
		city_graph[secondInd][firstInd]=roads.edge[k][2];
	}
	
	
	initialise();
	floydWarshall();
	
	for(k=0;k<cities.city_count;k++){
		for(l=0;l<cities.city_count;l++){
			int length=city_graph[k][l];
			if(length==INF){
				continue;
			}
		}
	}
	
	
	
	
	
	while(1) {
		char firstCity[30];
		char secondCity[30];
		// prompt user to enter two city names
		printf("Enter the cities: (you can write 0 0 to exit)\n");
		scanf("%s %s",firstCity,secondCity);
		if(!strcmp(firstCity,"0")&&!strcmp(secondCity,"0")){
			break;
		}
		int firstInd=lookup_string(firstCity);
		int secondInd=lookup_string(secondCity);
		if(firstInd==-1||secondInd==-1){
			continue;
		}	
		// print the shortest path between the two cities
		printPath(firstInd,secondInd);
		// print the length of the path
		printf("%d\n\n",city_graph[firstInd][secondInd]);
	}
	free(roads.edge);
	free(cities.str);
	return 0;	
}
