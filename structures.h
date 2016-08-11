
////////////////////////////////////////////////////
// HEADER WITH ALL DATA SRUCTURES FOR THE PROGRAM //
////////////////////////////////////////////////////

/* Global variales */
struct globalVariables
{
  float L;       // Lenght of the simulation in Mpc.
  int NpTot;   // Total number of particles
  float mass;    // Mass of each particle
  int NFiles;  //Numer of files to rewrite the snapshot
  float SnapLength; //Length (per axis) of each of the rewritten files
  char FILENAME[1000]; //Path of the gadget file

  /* COSMOLOGICAL PARAMETERS*/
  float OmegaM0;     //Omega matter at present time
  float OmegaL0;     //Omega Lambda at present time
  float zRS;         //Redshift of the simulation
  float aSF;         //Scale factor of the simulation
  float HubbleParam; //Hubble parameter of the simulation

}GV;

/* Structure particle */
struct particle
{
  unsigned int id;
  // Positions of particles
  float       pos[3];
  // Velocities of particles
  float       vel[3];
  // Mass of particles
  float       mass;
}*part=NULL, *copyPart=NULL;


/* Structure gadget_head */
struct gadget_head
{
  int      Npart[6];
  double   mass[6];
  double   time;
  double   redshift;
  int      flag_sfr;
  int      flag_feedback;
  int      npartTotal[6];
  int      flag_cooling;
  int      num_files;
  double   BoxSize;
  double   Omega0;
  double   OmegaLambda;
  double   HubbleParam; 
  char     fill[256- 6*4- 6*8- 2*8- 2*4- 6*4- 2*4 - 4*8];  /* fills to 
							      256 Bytes */
}Header;


/*+++++ Defines +++++*/
#define X 0
#define Y 1
#define Z 2
