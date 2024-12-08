# Depth First Search (or DFS) for a graph is a method where we traverse all adjacent vertices one by one.
# When we traverse an adjacent vertex, we completely finish the traversal of all vertices reachable through that adjacent vertex.
# After we finish traversing one adjacent vertex and its reachable vertices, we move to the next adjacent vertex and repeat the process.
# This is similar to a tree, where we first completely traverse the left subtree and then move to the right subtree.
# The key difference is that, unlike trees, graphs may contain cycles (a node may be visited more than once).
# To avoid processing a node multiple times, we use a boolean visited array.


# DFS from a Given Source of Undirected Graph:



# The algorithm starts from a given source and explores all reachable vertices from the given source. 
# It is similar to Preorder Tree Traversal where we visit the root, then recur for its children. 
# In a graph, there maybe loops. So we use an extra visited array to make sure that we do not process a vertex again.

include <bits/stdc++.h>
using namespace std;

# Recursive function for DFS traversal
void DFSRec(vector<vector<int>> &adj, vector<bool> &visited, int s){
  
    visited[s] = true;

    # Print the current vertex
    cout << s << " ";

    # Recursively visit all adjacent vertices that are not visited yet
    for (int i : adj[s])
        if (visited[i] == false)
            DFSRec(adj, visited, i);
}

# Main DFS function that initializes the visited array and call DFSRec
void DFS(vector<vector<int>> &adj, int s){
    vector<bool> visited(adj.size(), false);
    DFSRec(adj, visited, s);
}

# To add an edge in an undirected graph
void addEdge(vector<vector<int>> &adj, int s, int t){
    adj[s].push_back(t); 
    adj[t].push_back(s); 
}

int main(){
    int V = 5; 
    vector<vector<int>> adj(V);
  
    # Add edges
    vector<vector<int>> edges={{1, 2},{1, 0},{2, 0},{2, 3},{2, 4}};
    for (auto &e : edges)
        addEdge(adj, e[0], e[1]);

    int s = 1; // Starting vertex for DFS
    cout << "DFS from source: " << s << endl;
    DFS(adj, s); // Perform DFS starting from the source vertex

    return 0;
}


# Time complexity: O(V + E), where V is the number of vertices and E is the number of edges in the graph.
# Auxiliary Space: O(V + E), since an extra visited array of size V is required, And stack size for recursive calls to DFSRec function.



# DFS for Complete Traversal of Disconnected Undirected Graph

# The above implementation takes a source as an input and prints only those vertices that are reachable from the source and would not
# print all vertices in case of disconnected graph.
# Let us now talk about the algorithm that prints all vertices without any source and the graph maybe disconnected.




#include <bits/stdc++.h>
using namespace std;

void addEdge(vector<vector<int>> &adj, int s, int t){
    adj[s].push_back(t);
    adj[t].push_back(s);
}

# Recursive function for DFS traversal
void DFSRec(vector<vector<int>> &adj, vector<bool> &visited,int s){
    # Mark the current vertex as visited
    visited[s] = true;

    # Print the current vertex
    cout << s << " ";

    # Recursively visit all adjacent vertices that are not visited yet
    for (int i : adj[s])
        if (visited[i] == false)
            DFSRec(adj, visited, i);
}

# Main DFS function to perform DFS for the entire graph
void DFS(vector<vector<int>> &adj){
    vector<bool> visited(adj.size(), false);

    # Loop through all vertices to handle disconnected graph
    for (int i = 0; i < adj.size(); i++){
        if (visited[i] == false){
            # If vertex i has not been visited, perform DFS from it
            DFSRec(adj, visited, i);
        }
    }
}

int main(){
    int V = 6;
    # Create an adjacency list for the graph
    vector<vector<int>> adj(V);

    # Define the edges of the graph
    vector<vector<int>> edges = {{1, 2}, {2, 0}, {0, 3}, {4, 5}};

    # Populate the adjacency list with edges
    for (auto &e : edges)
        addEdge(adj, e[0], e[1]);

    cout << "Complete DFS of the graph:" << endl;
    DFS(adj);

    return 0;
}
