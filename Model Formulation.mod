set Neighborhood; 							# Origins (Data Points)
set Clusters; 							# Destinations (Clusters)

param cost {Neighborhood, Clusters} >= 0; 		# Costs (Euclidean distances)
var Cluster {Neighborhood, Clusters};			# Binary

minimize Total_Cost: sum {i in Neighborhood, j in Clusters} cost[i,j]*Cluster[i,j]; # Minimize overall distance

subject to Supply {i in Neighborhood}: sum {j in Clusters} Cluster[i,j] = 1;	# Ensures each neighborhood goes to a cluster
subject to Demand {j in Clusters}: sum {i in Neighborhood} Cluster[i,j] = 13;   # Ensures each cluster has 13 neighborhoods
subject to BinaryRelaxation{i in Neighborhood, j in Clusters}: 0 <= Cluster[i,j] <= 1; # To simplify IP to LP
