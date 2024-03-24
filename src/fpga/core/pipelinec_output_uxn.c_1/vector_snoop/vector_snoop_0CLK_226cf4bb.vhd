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
-- vectors_MUX[uxn_c_l254_c2_990f]
signal vectors_MUX_uxn_c_l254_c2_990f_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l254_c2_990f_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l254_c2_990f_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l254_c2_990f_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l255_c7_c1fe]
signal BIN_OP_EQ_uxn_c_l255_c7_c1fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l255_c7_c1fe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l255_c3_3aa5]
signal vectors_MUX_uxn_c_l255_c3_3aa5_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l255_c3_3aa5_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l255_c3_3aa5_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l255_c3_3aa5_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l257_c14_05a4]
signal BIN_OP_EQ_uxn_c_l257_c14_05a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c14_05a4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output : unsigned(0 downto 0);

-- vectors_MUX[uxn_c_l257_c10_ccc6]
signal vectors_MUX_uxn_c_l257_c10_ccc6_cond : unsigned(0 downto 0);
signal vectors_MUX_uxn_c_l257_c10_ccc6_iftrue : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l257_c10_ccc6_iffalse : vector_snoop_result_t;
signal vectors_MUX_uxn_c_l257_c10_ccc6_return_output : vector_snoop_result_t;

-- BIN_OP_EQ[uxn_c_l259_c14_3d49]
signal BIN_OP_EQ_uxn_c_l259_c14_3d49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_3d49_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l259_c10_0c71]
signal vectors_controller_MUX_uxn_c_l259_c10_0c71_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l261_c14_bd1a]
signal BIN_OP_EQ_uxn_c_l261_c14_bd1a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l261_c14_bd1a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output : unsigned(0 downto 0);

-- vectors_controller_MUX[uxn_c_l261_c10_e822]
signal vectors_controller_MUX_uxn_c_l261_c10_e822_cond : unsigned(0 downto 0);
signal vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse : unsigned(15 downto 0);
signal vectors_controller_MUX_uxn_c_l261_c10_e822_return_output : unsigned(15 downto 0);

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
-- vectors_MUX_uxn_c_l254_c2_990f
vectors_MUX_uxn_c_l254_c2_990f : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l254_c2_990f_cond,
vectors_MUX_uxn_c_l254_c2_990f_iftrue,
vectors_MUX_uxn_c_l254_c2_990f_iffalse,
vectors_MUX_uxn_c_l254_c2_990f_return_output);

-- BIN_OP_EQ_uxn_c_l255_c7_c1fe
BIN_OP_EQ_uxn_c_l255_c7_c1fe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l255_c7_c1fe_left,
BIN_OP_EQ_uxn_c_l255_c7_c1fe_right,
BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output);

-- vectors_MUX_uxn_c_l255_c3_3aa5
vectors_MUX_uxn_c_l255_c3_3aa5 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l255_c3_3aa5_cond,
vectors_MUX_uxn_c_l255_c3_3aa5_iftrue,
vectors_MUX_uxn_c_l255_c3_3aa5_iffalse,
vectors_MUX_uxn_c_l255_c3_3aa5_return_output);

-- BIN_OP_EQ_uxn_c_l257_c14_05a4
BIN_OP_EQ_uxn_c_l257_c14_05a4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l257_c14_05a4_left,
BIN_OP_EQ_uxn_c_l257_c14_05a4_right,
BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output);

-- vectors_MUX_uxn_c_l257_c10_ccc6
vectors_MUX_uxn_c_l257_c10_ccc6 : entity work.MUX_uint1_t_vector_snoop_result_t_vector_snoop_result_t_0CLK_de264c78 port map (
vectors_MUX_uxn_c_l257_c10_ccc6_cond,
vectors_MUX_uxn_c_l257_c10_ccc6_iftrue,
vectors_MUX_uxn_c_l257_c10_ccc6_iffalse,
vectors_MUX_uxn_c_l257_c10_ccc6_return_output);

-- BIN_OP_EQ_uxn_c_l259_c14_3d49
BIN_OP_EQ_uxn_c_l259_c14_3d49 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l259_c14_3d49_left,
BIN_OP_EQ_uxn_c_l259_c14_3d49_right,
BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output);

-- vectors_controller_MUX_uxn_c_l259_c10_0c71
vectors_controller_MUX_uxn_c_l259_c10_0c71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l259_c10_0c71_cond,
vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue,
vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse,
vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output);

-- BIN_OP_EQ_uxn_c_l261_c14_bd1a
BIN_OP_EQ_uxn_c_l261_c14_bd1a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l261_c14_bd1a_left,
BIN_OP_EQ_uxn_c_l261_c14_bd1a_right,
BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output);

-- vectors_controller_MUX_uxn_c_l261_c10_e822
vectors_controller_MUX_uxn_c_l261_c10_e822 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
vectors_controller_MUX_uxn_c_l261_c10_e822_cond,
vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue,
vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse,
vectors_controller_MUX_uxn_c_l261_c10_e822_return_output);



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
 vectors_MUX_uxn_c_l254_c2_990f_return_output,
 BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output,
 vectors_MUX_uxn_c_l255_c3_3aa5_return_output,
 BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output,
 vectors_MUX_uxn_c_l257_c10_ccc6_return_output,
 BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output,
 vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output,
 BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output,
 vectors_controller_MUX_uxn_c_l261_c10_e822_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : vector_snoop_result_t;
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l254_c2_990f_iftrue : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c3_3aa5_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c2_990f_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c2_990f_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l254_c2_990f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l255_c3_3aa5_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iffalse : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l257_c10_ccc6_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l255_c3_3aa5_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l256_c21_d904_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output : unsigned(0 downto 0);
 variable VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iftrue : vector_snoop_result_t;
 variable VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l257_c10_ccc6_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iffalse : vector_snoop_result_t;
 variable VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l257_c10_ccc6_return_output : vector_snoop_result_t;
 variable VAR_vectors_MUX_uxn_c_l257_c10_ccc6_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l258_c21_1d3b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_8_uxn_c_l260_c25_4e7f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output : unsigned(0 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse : unsigned(15 downto 0);
 variable VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_cond : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_c_l262_c25_7682_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l256_l258_DUPLICATE_a3a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vectors : vector_snoop_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_vectors := vectors;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_right := to_unsigned(129, 8);
     VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_right := to_unsigned(128, 8);

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
     VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_left := VAR_device_ram_address;
     VAR_vectors_MUX_uxn_c_l254_c2_990f_cond := VAR_is_device_ram_write;
     VAR_vectors_MUX_uxn_c_l254_c2_990f_iffalse := vectors;
     -- BIN_OP_EQ[uxn_c_l255_c7_c1fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l255_c7_c1fe_left <= VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_left;
     BIN_OP_EQ_uxn_c_l255_c7_c1fe_right <= VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output := BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output;

     -- BIN_OP_EQ[uxn_c_l259_c14_3d49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l259_c14_3d49_left <= VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_left;
     BIN_OP_EQ_uxn_c_l259_c14_3d49_right <= VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output := BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l256_l258_DUPLICATE_a3a3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l256_l258_DUPLICATE_a3a3_return_output := vectors.screen;

     -- BIN_OP_EQ[uxn_c_l261_c14_bd1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l261_c14_bd1a_left <= VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_left;
     BIN_OP_EQ_uxn_c_l261_c14_bd1a_right <= VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output := BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output;

     -- CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b_return_output := vectors.controller;

     -- BIN_OP_EQ[uxn_c_l257_c14_05a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l257_c14_05a4_left <= VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_left;
     BIN_OP_EQ_uxn_c_l257_c14_05a4_right <= VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output := BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output;

     -- Submodule level 1
     VAR_vectors_MUX_uxn_c_l255_c3_3aa5_cond := VAR_BIN_OP_EQ_uxn_c_l255_c7_c1fe_return_output;
     VAR_vectors_MUX_uxn_c_l257_c10_ccc6_cond := VAR_BIN_OP_EQ_uxn_c_l257_c14_05a4_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_cond := VAR_BIN_OP_EQ_uxn_c_l259_c14_3d49_return_output;
     VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_cond := VAR_BIN_OP_EQ_uxn_c_l261_c14_bd1a_return_output;
     VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse := VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b_return_output;
     -- uint16_uint8_8[uxn_c_l260_c25_4e7f] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l260_c25_4e7f_return_output := uint16_uint8_8(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_8[uxn_c_l256_c21_d904] LATENCY=0
     VAR_uint16_uint8_8_uxn_c_l256_c21_d904_return_output := uint16_uint8_8(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l256_l258_DUPLICATE_a3a3_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_0[uxn_c_l258_c21_1d3b] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l258_c21_1d3b_return_output := uint16_uint8_0(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_screen_d41d_uxn_c_l256_l258_DUPLICATE_a3a3_return_output,
     VAR_device_ram_value);

     -- uint16_uint8_0[uxn_c_l262_c25_7682] LATENCY=0
     VAR_uint16_uint8_0_uxn_c_l262_c25_7682_return_output := uint16_uint8_0(
     VAR_CONST_REF_RD_uint16_t_vector_snoop_result_t_controller_d41d_uxn_c_l261_l262_l260_DUPLICATE_b70b_return_output,
     VAR_device_ram_value);

     -- Submodule level 2
     VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue := VAR_uint16_uint8_0_uxn_c_l262_c25_7682_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue := VAR_uint16_uint8_8_uxn_c_l260_c25_4e7f_return_output;
     -- vectors_controller_MUX[uxn_c_l261_c10_e822] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l261_c10_e822_cond <= VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_cond;
     vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue <= VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iftrue;
     vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse <= VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_return_output := vectors_controller_MUX_uxn_c_l261_c10_e822_return_output;

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l255_c3_3aa5] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l255_c3_3aa5_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_uint16_uint8_8_uxn_c_l256_c21_d904_return_output);

     -- vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02[uxn_c_l257_c10_ccc6] LATENCY=0
     VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l257_c10_ccc6_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02(
     vectors,
     VAR_uint16_uint8_0_uxn_c_l258_c21_1d3b_return_output);

     -- Submodule level 3
     VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l255_c3_3aa5_return_output;
     VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iftrue := VAR_vectors_TRUE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9b02_uxn_c_l257_c10_ccc6_return_output;
     VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse := VAR_vectors_controller_MUX_uxn_c_l261_c10_e822_return_output;
     -- vectors_controller_MUX[uxn_c_l259_c10_0c71] LATENCY=0
     -- Inputs
     vectors_controller_MUX_uxn_c_l259_c10_0c71_cond <= VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_cond;
     vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue <= VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iftrue;
     vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse <= VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_iffalse;
     -- Outputs
     VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output := vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output;

     -- Submodule level 4
     -- vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05[uxn_c_l257_c10_ccc6] LATENCY=0
     VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l257_c10_ccc6_return_output := CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05(
     vectors,
     VAR_vectors_controller_MUX_uxn_c_l259_c10_0c71_return_output);

     -- Submodule level 5
     VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iffalse := VAR_vectors_FALSE_INPUT_MUX_CONST_REF_RD_vector_snoop_result_t_vector_snoop_result_t_9d05_uxn_c_l257_c10_ccc6_return_output;
     -- vectors_MUX[uxn_c_l257_c10_ccc6] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l257_c10_ccc6_cond <= VAR_vectors_MUX_uxn_c_l257_c10_ccc6_cond;
     vectors_MUX_uxn_c_l257_c10_ccc6_iftrue <= VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iftrue;
     vectors_MUX_uxn_c_l257_c10_ccc6_iffalse <= VAR_vectors_MUX_uxn_c_l257_c10_ccc6_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l257_c10_ccc6_return_output := vectors_MUX_uxn_c_l257_c10_ccc6_return_output;

     -- Submodule level 6
     VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iffalse := VAR_vectors_MUX_uxn_c_l257_c10_ccc6_return_output;
     -- vectors_MUX[uxn_c_l255_c3_3aa5] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l255_c3_3aa5_cond <= VAR_vectors_MUX_uxn_c_l255_c3_3aa5_cond;
     vectors_MUX_uxn_c_l255_c3_3aa5_iftrue <= VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iftrue;
     vectors_MUX_uxn_c_l255_c3_3aa5_iffalse <= VAR_vectors_MUX_uxn_c_l255_c3_3aa5_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l255_c3_3aa5_return_output := vectors_MUX_uxn_c_l255_c3_3aa5_return_output;

     -- Submodule level 7
     VAR_vectors_MUX_uxn_c_l254_c2_990f_iftrue := VAR_vectors_MUX_uxn_c_l255_c3_3aa5_return_output;
     -- vectors_MUX[uxn_c_l254_c2_990f] LATENCY=0
     -- Inputs
     vectors_MUX_uxn_c_l254_c2_990f_cond <= VAR_vectors_MUX_uxn_c_l254_c2_990f_cond;
     vectors_MUX_uxn_c_l254_c2_990f_iftrue <= VAR_vectors_MUX_uxn_c_l254_c2_990f_iftrue;
     vectors_MUX_uxn_c_l254_c2_990f_iffalse <= VAR_vectors_MUX_uxn_c_l254_c2_990f_iffalse;
     -- Outputs
     VAR_vectors_MUX_uxn_c_l254_c2_990f_return_output := vectors_MUX_uxn_c_l254_c2_990f_return_output;

     -- Submodule level 8
     VAR_return_output := VAR_vectors_MUX_uxn_c_l254_c2_990f_return_output;
     REG_VAR_vectors := VAR_vectors_MUX_uxn_c_l254_c2_990f_return_output;
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
