#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <sstream>

// Structure to represent a cut
struct Cut {
    std::vector<std::string> inputs;
};

// Function to read cuts from file
std::unordered_map<std::string, std::vector<Cut>> readCutsFromFile(const std::string& filename) {
    std::unordered_map<std::string, std::vector<Cut>> cuts;
    std::ifstream file(filename);
    std::string line;

    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return cuts;
    }

    std::string currentNode;
    while (std::getline(file, line)) {
        if (line.empty()) continue;

        if (line[0] != '\t') {
            // This is a node name
            currentNode = line;
            cuts[currentNode] = std::vector<Cut>();
        } else {
            // This is a cut
            Cut cut;
            std::istringstream iss(line.substr(1)); // Remove the leading tab
            std::string input;
            while (iss >> input) {
                cut.inputs.push_back(input);
            }
            cuts[currentNode].push_back(cut);
        }
    }

    return cuts;
}

int main() {
    std::string filename = "./cuts.txt";
    auto cuts = readCutsFromFile(filename);

    // Example of how to access the cuts
    for (const auto& [node, nodecuts] : cuts) {
        std::cout << "Node: " << node << std::endl;
        for (const auto& cut : nodecuts) {
            std::cout << "\tCut: ";
            for (const auto& input : cut.inputs) {
                std::cout << input << " ";
            }
            std::cout << std::endl;
        }
    }

    return 0;
}
