#include <iostream>
#include <bbb/bbb.hxx>

int main (int argc, char* argv[])
{
  using namespace std;

  if (argc < 2)
  {
    cerr << "error: missing name" << endl;
    return 1;
  }

  bbb::say_hello(cout, argv[1]);
}
