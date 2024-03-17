-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 16
entity vector_snoop_0CLK_226cf4bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 return_output : out vector_snoop_result_t);
end vector_snoop_0CLK_226cf4bb;
architecture arch of vector_snoop_0CLK_226cf4bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal vectors : vector_snoop_result_t := (
screen => to_unsigned(0, 16),
controller => to_unsigned(0, 16))
;
signal REG_COMB_vectors : vector_snoop_result_t;

-- Each function instance gets signals
-- vectors_MUX[uxn_c_l255_c2_fe33]
signal vectors_MUX_uxn_c_l255_c2_fe33_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l255_c2_fe33_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l255_c2_fe33_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l255_c2_fe33_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l256_c7_0df0]
signal BIN_OP_EQ_uxn_c_l256_c7_0df0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_0df0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l256_c3_e3b2]
signal vectors_MUX_uxn_c_l256_c3_e3b2_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l256_c3_e3b2_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l256_c3_e3b2_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l256_c3_e3b2_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l258_c14_9632]
signal BIN_OP_EQ_uxn_c_l258_c14_9632_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c14_9632_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l258_c14_9632_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l258_c10_cbdb]
signal vectors_MUX_uxn_c_l258_c10_cbdb_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l258_c10_cbdb_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l258_c10_cbdb_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l258_c10_cbdb_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l260_c14_99b4]
signal BIN_OP_EQ_uxn_c_l260_c14_99b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c14_99b4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l260_c10_9b42]
signal vectors_controller_MUX_uxn_c_l260_c10_9b42_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l262_c14_93cc]
signal BIN_OP_EQ_uxn_c_l262_c14_93cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c14_93cc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l262_c10_8dfd]
signal vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output : unsigned(15 downto 0);

function uint16_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02( ref_toks_0 : vector_snoop_result_t;
 ref_toks_1 : unsigned) return vector_snoop_result_t is
 
  variable base : vector_snoop_result_t; 
  variable return_output : vector_snoop_result_t;
begin
      base := ref_toks_0;
      base.screen := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function uint16_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05( ref_toks_0 : vector_snoop_result_t;
 ref_toks_1 : unsigned) return vector_snoop_result_t is
 
  variable base : vector_snoop_result_t; 
  variable return_output : vector_snoop_result_t;
begin
      base := ref_toks_0;
      base.controller := ref_toks_1;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- vectors_MUX_uxn_c_l255_c2_fe33
vectors_MUX_uxn_c_l255_c2_fe33 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l255_c2_fe33_cond,
vectors_MUX_uxn_c_l255_c2_fe33_iftrue,
vectors_MUX_uxn_c_l255_c2_fe33_iffalse,
vectors_MUX_uxn_c_l255_c2_fe33_return_output);

-- BIN_OP_EQ_uxn_c_l256_c7_0df0
BIN_OP_EQ_uxn_c_l256_c7_0df0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l256_c7_0df0_left,
BIN_OP_EQ_uxn_c_l256_c7_0df0_right,
BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output);

-- vectors_MUX_uxn_c_l256_c3_e3b2
vectors_MUX_uxn_c_l256_c3_e3b2 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l256_c3_e3b2_cond,
vectors_MUX_uxn_c_l256_c3_e3b2_iftrue,
vectors_MUX_uxn_c_l256_c3_e3b2_iffalse,
vectors_MUX_uxn_c_l256_c3_e3b2_return_output);

-- BIN_OP_EQ_uxn_c_l258_c14_9632
BIN_OP_EQ_uxn_c_l258_c14_9632 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l258_c14_9632_left,
BIN_OP_EQ_uxn_c_l258_c14_9632_right,
BIN_OP_EQ_uxn_c_l258_c14_9632_return_output);

-- vectors_MUX_uxn_c_l258_c10_cbdb
vectors_MUX_uxn_c_l258_c10_cbdb : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l258_c10_cbdb_cond,
vectors_MUX_uxn_c_l258_c10_cbdb_iftrue,
vectors_MUX_uxn_c_l258_c10_cbdb_iffalse,
vectors_MUX_uxn_c_l258_c10_cbdb_return_output);

-- BIN_OP_EQ_uxn_c_l260_c14_99b4
BIN_OP_EQ_uxn_c_l260_c14_99b4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l260_c14_99b4_left,
BIN_OP_EQ_uxn_c_l260_c14_99b4_right,
BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output);

-- vectors_controller_MUX_uxn_c_l260_c10_9b42
vectors_controller_MUX_uxn_c_l260_c10_9b42 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l260_c10_9b42_cond,
vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue,
vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse,
vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output);

-- BIN_OP_EQ_uxn_c_l262_c14_93cc
BIN_OP_EQ_uxn_c_l262_c14_93cc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l262_c14_93cc_left,
BIN_OP_EQ_uxn_c_l262_c14_93cc_right,
BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output);

-- vectors_controller_MUX_uxn_c_l262_c10_8dfd
vectors_controller_MUX_uxn_c_l262_c10_8dfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond,
vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue,
vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse,
vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 -- Registers
 vectors,
 -- All submodule outputs
 vectors_MUX_uxn_c_l255_c2_fe33_return_output,
 BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output,
 vectors_MUX_uxn_c_l256_c3_e3b2_return_output,
 BIN_OP_EQ_uxn_c_l258_c14_9632_return_output,
 vectors_MUX_uxn_c_l258_c10_cbdb_return_output,
 BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output,
 vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output,
 BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output,
 vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l255_c2_fe33_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l256_c3_e3b2_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c2_fe33_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c2_fe33_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c2_fe33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l256_c3_e3b2_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l258_c10_cbdb_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l256_c3_e3b2_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l257_c21_58ab_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l258_c10_cbdb_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l258_c10_cbdb_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l258_c10_cbdb_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l259_c21_7b56_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l261_c25_f8fb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l263_c25_3fa0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l259_l257_DUPLICATE_3546_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_right := to_unsigned(129, 8);
     VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_ram_address := device_ram_address;
     VAR_device_ram_value := device_ram_value;
     VAR_is_device_ram_write := is_device_ram_write;

     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l255_c2_fe33_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l255_c2_fe33_iffalse := vectors;
     -- BIN_OP_EQ[uxn_c_l260_c14_99b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l260_c14_99b4_left <= VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_left;
     BIN_OP_EQ_uxn_c_l260_c14_99b4_right <= VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output := BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f_return_output := vectors.controller;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l259_l257_DUPLICATE_3546 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l259_l257_DUPLICATE_3546_return_output := vectors.screen;

     -- BIN_OP_EQ[uxn_c_l256_c7_0df0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l256_c7_0df0_left <= VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_left;
     BIN_OP_EQ_uxn_c_l256_c7_0df0_right <= VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output := BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output;

     -- BIN_OP_EQ[uxn_c_l258_c14_9632] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l258_c14_9632_left <= VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_left;
     BIN_OP_EQ_uxn_c_l258_c14_9632_right <= VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_return_output := BIN_OP_EQ_uxn_c_l258_c14_9632_return_output;

     -- BIN_OP_EQ[uxn_c_l262_c14_93cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l262_c14_93cc_left <= VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_left;
     BIN_OP_EQ_uxn_c_l262_c14_93cc_right <= VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output := BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l256_c3_e3b2_cond := VAR_BIN_OP_EQ_uxn_c_l256_c7_0df0_return_output;
     VAR_vectors_MUX_uxn_c_l258_c10_cbdb_cond := VAR_BIN_OP_EQ_uxn_c_l258_c14_9632_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_cond := VAR_BIN_OP_EQ_uxn_c_l260_c14_99b4_return_output;
     VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond := VAR_BIN_OP_EQ_uxn_c_l262_c14_93cc_return_output;
     VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f_return_output;
     -- uint16_uint8_8[uxn_c_l257_c21_58ab] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l257_c21_58ab_return_output := uint16_uint8_8(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l259_l257_DUPLICATE_3546_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_0[uxn_c_l263_c25_3fa0] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l263_c25_3fa0_return_output := uint16_uint8_0(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_0[uxn_c_l259_c21_7b56] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l259_c21_7b56_return_output := uint16_uint8_0(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l259_l257_DUPLICATE_3546_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_8[uxn_c_l261_c25_f8fb] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l261_c25_f8fb_return_output := uint16_uint8_8(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l262_l263_l261_DUPLICATE_465f_return_output,
     VAR_device_ram_value);

     -- Submodule level 2
     VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue := VAR_uint16_uint8_0_uxn_c_l263_c25_3fa0_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue := VAR_uint16_uint8_8_uxn_c_l261_c25_f8fb_return_output;
     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l258_c10_cbdb] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l258_c10_cbdb_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_uint16_uint8_0_uxn_c_l259_c21_7b56_return_output);

     -- vectors_controller_MUX[uxn_c_l262_c10_8dfd] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond <= VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_cond;
     vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue <= VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iftrue;
     vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse <= VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output := vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output;

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l256_c3_e3b2] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l256_c3_e3b2_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_uint16_uint8_8_uxn_c_l257_c21_58ab_return_output);

     -- Submodule level 3
     VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l256_c3_e3b2_return_output;
     VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l258_c10_cbdb_return_output;
     VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse := VAR_vectors_controller_MUX_uxn_c_l262_c10_8dfd_return_output;
     -- vectors_controller_MUX[uxn_c_l260_c10_9b42] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l260_c10_9b42_cond <= VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_cond;
     vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue <= VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iftrue;
     vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse <= VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output := vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output;

     -- Submodule level 4
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l258_c10_cbdb] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l258_c10_cbdb_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l260_c10_9b42_return_output);

     -- Submodule level 5
     VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l258_c10_cbdb_return_output;
     -- vectors_MUX[uxn_c_l258_c10_cbdb] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l258_c10_cbdb_cond <= VAR_vectors_MUX_uxn_c_l258_c10_cbdb_cond;
     vectors_MUX_uxn_c_l258_c10_cbdb_iftrue <= VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iftrue;
     vectors_MUX_uxn_c_l258_c10_cbdb_iffalse <= VAR_vectors_MUX_uxn_c_l258_c10_cbdb_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l258_c10_cbdb_return_output := vectors_MUX_uxn_c_l258_c10_cbdb_return_output;

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iffalse := VAR_vectors_MUX_uxn_c_l258_c10_cbdb_return_output;
     -- vectors_MUX[uxn_c_l256_c3_e3b2] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l256_c3_e3b2_cond <= VAR_vectors_MUX_uxn_c_l256_c3_e3b2_cond;
     vectors_MUX_uxn_c_l256_c3_e3b2_iftrue <= VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iftrue;
     vectors_MUX_uxn_c_l256_c3_e3b2_iffalse <= VAR_vectors_MUX_uxn_c_l256_c3_e3b2_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l256_c3_e3b2_return_output := vectors_MUX_uxn_c_l256_c3_e3b2_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l255_c2_fe33_iftrue := VAR_vectors_MUX_uxn_c_l256_c3_e3b2_return_output;
     -- vectors_MUX[uxn_c_l255_c2_fe33] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l255_c2_fe33_cond <= VAR_vectors_MUX_uxn_c_l255_c2_fe33_cond;
     vectors_MUX_uxn_c_l255_c2_fe33_iftrue <= VAR_vectors_MUX_uxn_c_l255_c2_fe33_iftrue;
     vectors_MUX_uxn_c_l255_c2_fe33_iffalse <= VAR_vectors_MUX_uxn_c_l255_c2_fe33_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l255_c2_fe33_return_output := vectors_MUX_uxn_c_l255_c2_fe33_return_output;

     -- Submodule level 8
     VAR_return_output := VAR_vectors_MUX_uxn_c_l255_c2_fe33_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l255_c2_fe33_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_vectors <= REG_VAR_vectors;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     vectors <= REG_COMB_vectors;
 end if;
 end if;
end process;

end arch;
