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
-- Submodules: 11
entity vector_snoop_0CLK_10d8c973 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_ram_address : in unsigned(7 downto 0);
 device_ram_value : in unsigned(7 downto 0);
 is_device_ram_write : in unsigned(0 downto 0);
 return_output : out unsigned(15 downto 0));
end vector_snoop_0CLK_10d8c973;
architecture arch of vector_snoop_0CLK_10d8c973 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal screen_vector : unsigned(15 downto 0) := to_unsigned(0, 16);
signal REG_COMB_screen_vector : unsigned(15 downto 0);

-- Each function instance gets signals
-- screen_vector_MUX[uxn_c_l232_c2_3309]
signal screen_vector_MUX_uxn_c_l232_c2_3309_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3309_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3309_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l232_c2_3309_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l233_c7_8f51]
signal BIN_OP_EQ_uxn_c_l233_c7_8f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l233_c7_8f51_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l233_c3_96bb]
signal screen_vector_MUX_uxn_c_l233_c3_96bb_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l233_c3_96bb_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l234_c4_d29f]
signal BIN_OP_AND_uxn_c_l234_c4_d29f_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_d29f_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l234_c4_d29f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_c_l235_c22_0c76]
signal CONST_SL_8_uxn_c_l235_c22_0c76_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_c_l235_c22_0c76_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l235_c4_19d2]
signal BIN_OP_OR_uxn_c_l235_c4_19d2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_19d2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l235_c4_19d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_c_l237_c12_588f]
signal BIN_OP_EQ_uxn_c_l237_c12_588f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_588f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_c_l237_c12_588f_return_output : unsigned(0 downto 0);

-- screen_vector_MUX[uxn_c_l237_c8_6d63]
signal screen_vector_MUX_uxn_c_l237_c8_6d63_cond : unsigned(0 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse : unsigned(15 downto 0);
signal screen_vector_MUX_uxn_c_l237_c8_6d63_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_c_l238_c4_f4e3]
signal BIN_OP_AND_uxn_c_l238_c4_f4e3_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l238_c4_f4e3_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_c_l239_c4_33e9]
signal BIN_OP_OR_uxn_c_l239_c4_33e9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l239_c4_33e9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_c_l239_c4_33e9_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- screen_vector_MUX_uxn_c_l232_c2_3309
screen_vector_MUX_uxn_c_l232_c2_3309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l232_c2_3309_cond,
screen_vector_MUX_uxn_c_l232_c2_3309_iftrue,
screen_vector_MUX_uxn_c_l232_c2_3309_iffalse,
screen_vector_MUX_uxn_c_l232_c2_3309_return_output);

-- BIN_OP_EQ_uxn_c_l233_c7_8f51
BIN_OP_EQ_uxn_c_l233_c7_8f51 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l233_c7_8f51_left,
BIN_OP_EQ_uxn_c_l233_c7_8f51_right,
BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output);

-- screen_vector_MUX_uxn_c_l233_c3_96bb
screen_vector_MUX_uxn_c_l233_c3_96bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l233_c3_96bb_cond,
screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue,
screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse,
screen_vector_MUX_uxn_c_l233_c3_96bb_return_output);

-- BIN_OP_AND_uxn_c_l234_c4_d29f
BIN_OP_AND_uxn_c_l234_c4_d29f : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l234_c4_d29f_left,
BIN_OP_AND_uxn_c_l234_c4_d29f_right,
BIN_OP_AND_uxn_c_l234_c4_d29f_return_output);

-- CONST_SL_8_uxn_c_l235_c22_0c76
CONST_SL_8_uxn_c_l235_c22_0c76 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_c_l235_c22_0c76_x,
CONST_SL_8_uxn_c_l235_c22_0c76_return_output);

-- BIN_OP_OR_uxn_c_l235_c4_19d2
BIN_OP_OR_uxn_c_l235_c4_19d2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l235_c4_19d2_left,
BIN_OP_OR_uxn_c_l235_c4_19d2_right,
BIN_OP_OR_uxn_c_l235_c4_19d2_return_output);

-- BIN_OP_EQ_uxn_c_l237_c12_588f
BIN_OP_EQ_uxn_c_l237_c12_588f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_c_l237_c12_588f_left,
BIN_OP_EQ_uxn_c_l237_c12_588f_right,
BIN_OP_EQ_uxn_c_l237_c12_588f_return_output);

-- screen_vector_MUX_uxn_c_l237_c8_6d63
screen_vector_MUX_uxn_c_l237_c8_6d63 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
screen_vector_MUX_uxn_c_l237_c8_6d63_cond,
screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue,
screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse,
screen_vector_MUX_uxn_c_l237_c8_6d63_return_output);

-- BIN_OP_AND_uxn_c_l238_c4_f4e3
BIN_OP_AND_uxn_c_l238_c4_f4e3 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_c_l238_c4_f4e3_left,
BIN_OP_AND_uxn_c_l238_c4_f4e3_right,
BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output);

-- BIN_OP_OR_uxn_c_l239_c4_33e9
BIN_OP_OR_uxn_c_l239_c4_33e9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_c_l239_c4_33e9_left,
BIN_OP_OR_uxn_c_l239_c4_33e9_right,
BIN_OP_OR_uxn_c_l239_c4_33e9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_ram_address,
 device_ram_value,
 is_device_ram_write,
 -- Registers
 screen_vector,
 -- All submodule outputs
 screen_vector_MUX_uxn_c_l232_c2_3309_return_output,
 BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output,
 screen_vector_MUX_uxn_c_l233_c3_96bb_return_output,
 BIN_OP_AND_uxn_c_l234_c4_d29f_return_output,
 CONST_SL_8_uxn_c_l235_c22_0c76_return_output,
 BIN_OP_OR_uxn_c_l235_c4_19d2_return_output,
 BIN_OP_EQ_uxn_c_l237_c12_588f_return_output,
 screen_vector_MUX_uxn_c_l237_c8_6d63_return_output,
 BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output,
 BIN_OP_OR_uxn_c_l239_c4_33e9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_address : unsigned(7 downto 0);
 variable VAR_device_ram_value : unsigned(7 downto 0);
 variable VAR_is_device_ram_write : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3309_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l232_c2_3309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_return_output : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l235_c22_0c76_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_right : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_c_l235_c22_0c76_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_return_output : unsigned(0 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse : unsigned(15 downto 0);
 variable VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l235_l239_DUPLICATE_c4a4_return_output : unsigned(15 downto 0);
 -- State registers comb logic variables
variable REG_VAR_screen_vector : unsigned(15 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_screen_vector := screen_vector;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_right := to_unsigned(65280, 16);
     VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_right := to_unsigned(33, 8);
     VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_right := to_unsigned(255, 16);

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
     VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_left := VAR_device_ram_address;
     VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_left := VAR_device_ram_address;
     VAR_screen_vector_MUX_uxn_c_l232_c2_3309_cond := VAR_is_device_ram_write;
     VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_left := screen_vector;
     VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_left := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iffalse := screen_vector;
     VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse := screen_vector;
     -- BIN_OP_AND[uxn_c_l238_c4_f4e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l238_c4_f4e3_left <= VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_left;
     BIN_OP_AND_uxn_c_l238_c4_f4e3_right <= VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output := BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_c_l235_l239_DUPLICATE_c4a4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l235_l239_DUPLICATE_c4a4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_device_ram_value);

     -- BIN_OP_AND[uxn_c_l234_c4_d29f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_c_l234_c4_d29f_left <= VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_left;
     BIN_OP_AND_uxn_c_l234_c4_d29f_right <= VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_return_output := BIN_OP_AND_uxn_c_l234_c4_d29f_return_output;

     -- BIN_OP_EQ[uxn_c_l237_c12_588f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l237_c12_588f_left <= VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_left;
     BIN_OP_EQ_uxn_c_l237_c12_588f_right <= VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_return_output := BIN_OP_EQ_uxn_c_l237_c12_588f_return_output;

     -- BIN_OP_EQ[uxn_c_l233_c7_8f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_c_l233_c7_8f51_left <= VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_left;
     BIN_OP_EQ_uxn_c_l233_c7_8f51_right <= VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output := BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output;

     -- Submodule level 1
     VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_left := VAR_BIN_OP_AND_uxn_c_l234_c4_d29f_return_output;
     VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_left := VAR_BIN_OP_AND_uxn_c_l238_c4_f4e3_return_output;
     VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_cond := VAR_BIN_OP_EQ_uxn_c_l233_c7_8f51_return_output;
     VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_cond := VAR_BIN_OP_EQ_uxn_c_l237_c12_588f_return_output;
     VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l235_l239_DUPLICATE_c4a4_return_output;
     VAR_CONST_SL_8_uxn_c_l235_c22_0c76_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_c_l235_l239_DUPLICATE_c4a4_return_output;
     -- BIN_OP_OR[uxn_c_l239_c4_33e9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l239_c4_33e9_left <= VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_left;
     BIN_OP_OR_uxn_c_l239_c4_33e9_right <= VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_return_output := BIN_OP_OR_uxn_c_l239_c4_33e9_return_output;

     -- CONST_SL_8[uxn_c_l235_c22_0c76] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_c_l235_c22_0c76_x <= VAR_CONST_SL_8_uxn_c_l235_c22_0c76_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_c_l235_c22_0c76_return_output := CONST_SL_8_uxn_c_l235_c22_0c76_return_output;

     -- Submodule level 2
     VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue := VAR_BIN_OP_OR_uxn_c_l239_c4_33e9_return_output;
     VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_right := VAR_CONST_SL_8_uxn_c_l235_c22_0c76_return_output;
     -- BIN_OP_OR[uxn_c_l235_c4_19d2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_c_l235_c4_19d2_left <= VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_left;
     BIN_OP_OR_uxn_c_l235_c4_19d2_right <= VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_return_output := BIN_OP_OR_uxn_c_l235_c4_19d2_return_output;

     -- screen_vector_MUX[uxn_c_l237_c8_6d63] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l237_c8_6d63_cond <= VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_cond;
     screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue <= VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iftrue;
     screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse <= VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_return_output := screen_vector_MUX_uxn_c_l237_c8_6d63_return_output;

     -- Submodule level 3
     VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue := VAR_BIN_OP_OR_uxn_c_l235_c4_19d2_return_output;
     VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse := VAR_screen_vector_MUX_uxn_c_l237_c8_6d63_return_output;
     -- screen_vector_MUX[uxn_c_l233_c3_96bb] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l233_c3_96bb_cond <= VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_cond;
     screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue <= VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iftrue;
     screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse <= VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_return_output := screen_vector_MUX_uxn_c_l233_c3_96bb_return_output;

     -- Submodule level 4
     VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iftrue := VAR_screen_vector_MUX_uxn_c_l233_c3_96bb_return_output;
     -- screen_vector_MUX[uxn_c_l232_c2_3309] LATENCY=0
     -- Inputs
     screen_vector_MUX_uxn_c_l232_c2_3309_cond <= VAR_screen_vector_MUX_uxn_c_l232_c2_3309_cond;
     screen_vector_MUX_uxn_c_l232_c2_3309_iftrue <= VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iftrue;
     screen_vector_MUX_uxn_c_l232_c2_3309_iffalse <= VAR_screen_vector_MUX_uxn_c_l232_c2_3309_iffalse;
     -- Outputs
     VAR_screen_vector_MUX_uxn_c_l232_c2_3309_return_output := screen_vector_MUX_uxn_c_l232_c2_3309_return_output;

     -- Submodule level 5
     VAR_return_output := VAR_screen_vector_MUX_uxn_c_l232_c2_3309_return_output;
     REG_VAR_screen_vector := VAR_screen_vector_MUX_uxn_c_l232_c2_3309_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_screen_vector <= REG_VAR_screen_vector;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     screen_vector <= REG_COMB_screen_vector;
 end if;
 end if;
end process;

end arch;
