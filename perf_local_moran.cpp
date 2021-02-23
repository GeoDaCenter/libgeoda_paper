//
// Created by Xun Li on 2/5/21.
//

#include <iostream>
#include <vector>
#include <chrono>
using namespace std::chrono;

#include <libgeoda/libgeoda.h>
#include <libgeoda/weights/GeodaWeight.h>
#include <libgeoda/sa/LISA.h>
#include <libgeoda/sa/BatchLISA.h>
#include <libgeoda/gda_weights.h>
#include <libgeoda/gda_sa.h>


int main(int argc, char *argv[])
{
    if (argc < 4) {
        std::cout << "Usage: perf_libgeoda ./data/natregimes.shp HR60 complete" << std::endl;
        return 0;
    }

    std::string file_path = argv[1];
    std::string var_name = argv[2];
    std::string method = argv[3];

    GeoDa gda(file_path.c_str());

    GeoDaWeight* w = 0;

    // create weights
    auto t1 = std::chrono::high_resolution_clock::now();
    if (file_path.compare("./data/Chicago_parcels_points.shp") == 0) {
        w = gda_knn_weights(&gda, 10, 1.0, false, false, false, "", 0.0, false, false, "");
    } else {
        w = gda_queen_weights(&gda, 1, false, 0);
    }
    auto t2 = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>( t2 - t1 ).count();
    std::cout << "Weights creation takes: " << duration << " milliseconds." << std::endl;

    // get data
    std::vector<double> vals = gda.GetNumericCol(var_name);
    std::vector<bool> undefs;
    double significance_cutoff = 0.01;
    int seed = 123456789;
    int permutations[3]  = {999, 9999, 99999};
    int threads[3] = {1, 8, 16};

    for (int p = 0; p < 3; ++p) {
        int perm = permutations[p];
        for (int t=0; t < 3; ++t) {
            int thread = threads[t];
            double run_time = 0;
            for (int i = 0; i < 3; ++i) {
                auto t1 = std::chrono::high_resolution_clock::now();
                LISA *lisa = gda_localmoran(w, vals, undefs, 0.01, thread, perm, method, seed);
                auto t2 = std::chrono::high_resolution_clock::now();
                auto duration = std::chrono::duration_cast<std::chrono::milliseconds>( t2 - t1 ).count();
                run_time += duration;
                delete lisa;
            }
            std::cout << "perm: " << perm << " threads: " << thread << " avg of 3 runs: " << run_time /3.0 <<
            " milliseconds." << std::endl;
        }
    }

    delete w;
}