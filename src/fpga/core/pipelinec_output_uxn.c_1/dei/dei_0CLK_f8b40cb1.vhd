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
-- Submodules: 9
entity dei_0CLK_f8b40cb1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_offset : in unsigned(7 downto 0);
 addr : in unsigned(7 downto 0));
end dei_0CLK_f8b40cb1;
architecture arch of dei_0CLK_f8b40cb1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal dei_mask : uint16_t_16 := (
0 => to_unsigned(0, 16),
1 => to_unsigned(0, 16),
2 => to_unsigned(60, 16),
3 => to_unsigned(20, 16),
4 => to_unsigned(20, 16),
5 => to_unsigned(20, 16),
6 => to_unsigned(20, 16),
7 => to_unsigned(0, 16),
8 => to_unsigned(0, 16),
9 => to_unsigned(0, 16),
10 => to_unsigned(0, 16),
11 => to_unsigned(0, 16),
12 => to_unsigned(2047, 16),
13 => to_unsigned(0, 16),
14 => to_unsigned(0, 16),
15 => to_unsigned(0, 16),
others => to_unsigned(0, 16))
;
signal is_event : unsigned(15 downto 0) := to_unsigned(0, 16);
signal value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal REG_COMB_dei_mask : uint16_t_16;
signal REG_COMB_is_event : unsigned(15 downto 0);
signal REG_COMB_value : unsigned(7 downto 0);

-- Each function instance gets signals
-- CONST_SR_4[uxn_device_h_l59_c23_6421]
signal CONST_SR_4_uxn_device_h_l59_c23_6421_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l59_c23_6421_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_0d1f]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c39_4d98]
signal BIN_OP_AND_uxn_device_h_l59_c39_4d98_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_4d98_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l59_c14_1e60]
signal BIN_OP_SR_uxn_device_h_l59_c14_1e60_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_1e60_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c14_76f8]
signal BIN_OP_AND_uxn_device_h_l59_c14_76f8_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_76f8_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output : unsigned(15 downto 0);

-- uxn_dei[uxn_device_h_l60_c21_32cc]
signal uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_32cc_addr : unsigned(7 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_32cc_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l60_c37_7c45]
signal peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l60_c37_7c45_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l60_c37_7c45_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l60_c10_46c1]
signal MUX_uxn_device_h_l60_c10_46c1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l60_c10_46c1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_46c1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_46c1_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l61_c2_5295]
signal put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_5295_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_5295_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l61_c2_5295_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_uxn_device_h_l59_c23_6421
CONST_SR_4_uxn_device_h_l59_c23_6421 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l59_c23_6421_x,
CONST_SR_4_uxn_device_h_l59_c23_6421_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c39_4d98
BIN_OP_AND_uxn_device_h_l59_c39_4d98 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c39_4d98_left,
BIN_OP_AND_uxn_device_h_l59_c39_4d98_right,
BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output);

-- BIN_OP_SR_uxn_device_h_l59_c14_1e60
BIN_OP_SR_uxn_device_h_l59_c14_1e60 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l59_c14_1e60_left,
BIN_OP_SR_uxn_device_h_l59_c14_1e60_right,
BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c14_76f8
BIN_OP_AND_uxn_device_h_l59_c14_76f8 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c14_76f8_left,
BIN_OP_AND_uxn_device_h_l59_c14_76f8_right,
BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output);

-- uxn_dei_uxn_device_h_l60_c21_32cc
uxn_dei_uxn_device_h_l60_c21_32cc : entity work.uxn_dei_0CLK_794db3df port map (
clk,
uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE,
uxn_dei_uxn_device_h_l60_c21_32cc_addr,
uxn_dei_uxn_device_h_l60_c21_32cc_return_output);

-- peek_dev_uxn_device_h_l60_c37_7c45
peek_dev_uxn_device_h_l60_c37_7c45 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE,
peek_dev_uxn_device_h_l60_c37_7c45_address,
peek_dev_uxn_device_h_l60_c37_7c45_return_output);

-- MUX_uxn_device_h_l60_c10_46c1
MUX_uxn_device_h_l60_c10_46c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l60_c10_46c1_cond,
MUX_uxn_device_h_l60_c10_46c1_iftrue,
MUX_uxn_device_h_l60_c10_46c1_iffalse,
MUX_uxn_device_h_l60_c10_46c1_return_output);

-- put_stack_uxn_device_h_l61_c2_5295
put_stack_uxn_device_h_l61_c2_5295 : entity work.put_stack_0CLK_e3ba3c7d port map (
clk,
put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE,
put_stack_uxn_device_h_l61_c2_5295_stack_index,
put_stack_uxn_device_h_l61_c2_5295_offset,
put_stack_uxn_device_h_l61_c2_5295_value);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 stack_offset,
 addr,
 -- Registers
 dei_mask,
 is_event,
 value,
 -- All submodule outputs
 CONST_SR_4_uxn_device_h_l59_c23_6421_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output,
 BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output,
 BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output,
 BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output,
 uxn_dei_uxn_device_h_l60_c21_32cc_return_output,
 peek_dev_uxn_device_h_l60_c37_7c45_return_output,
 MUX_uxn_device_h_l60_c10_46c1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_offset : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_is_event_uxn_device_h_l59_c2_2d71 : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_46c1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_46c1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_46c1_iffalse : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_32cc_addr : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_32cc_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_7c45_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_7c45_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_46c1_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_5295_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_5295_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_5295_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_dei_mask : uint16_t_16;
variable REG_VAR_is_event : unsigned(15 downto 0);
variable REG_VAR_value : unsigned(7 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_dei_mask := dei_mask;
  REG_VAR_is_event := is_event;
  REG_VAR_value := value;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_stack_offset := stack_offset;
     VAR_addr := addr;

     -- Submodule level 0
     VAR_peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_left := VAR_addr;
     VAR_peek_dev_uxn_device_h_l60_c37_7c45_address := VAR_addr;
     VAR_uxn_dei_uxn_device_h_l60_c21_32cc_addr := VAR_addr;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0 := dei_mask;
     REG_VAR_dei_mask := dei_mask;
     VAR_put_stack_uxn_device_h_l61_c2_5295_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l61_c2_5295_offset := VAR_stack_offset;
     VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_x := value;
     -- uxn_dei[uxn_device_h_l60_c21_32cc] LATENCY=0
     -- Clock enable
     uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE <= VAR_uxn_dei_uxn_device_h_l60_c21_32cc_CLOCK_ENABLE;
     -- Inputs
     uxn_dei_uxn_device_h_l60_c21_32cc_addr <= VAR_uxn_dei_uxn_device_h_l60_c21_32cc_addr;
     -- Outputs
     VAR_uxn_dei_uxn_device_h_l60_c21_32cc_return_output := uxn_dei_uxn_device_h_l60_c21_32cc_return_output;

     -- peek_dev[uxn_device_h_l60_c37_7c45] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l60_c37_7c45_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l60_c37_7c45_address <= VAR_peek_dev_uxn_device_h_l60_c37_7c45_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l60_c37_7c45_return_output := peek_dev_uxn_device_h_l60_c37_7c45_return_output;

     -- CONST_SR_4[uxn_device_h_l59_c23_6421] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l59_c23_6421_x <= VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_return_output := CONST_SR_4_uxn_device_h_l59_c23_6421_return_output;

     -- BIN_OP_AND[uxn_device_h_l59_c39_4d98] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c39_4d98_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_left;
     BIN_OP_AND_uxn_device_h_l59_c39_4d98_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output := BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_right := VAR_BIN_OP_AND_uxn_device_h_l59_c39_4d98_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l59_c23_6421_return_output, 4);
     VAR_MUX_uxn_device_h_l60_c10_46c1_iffalse := VAR_peek_dev_uxn_device_h_l60_c37_7c45_return_output;
     VAR_MUX_uxn_device_h_l60_c10_46c1_iftrue := VAR_uxn_dei_uxn_device_h_l60_c21_32cc_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_0d1f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_0d1f_return_output;
     -- BIN_OP_SR[uxn_device_h_l59_c14_1e60] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l59_c14_1e60_left <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_left;
     BIN_OP_SR_uxn_device_h_l59_c14_1e60_right <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output := BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_left := VAR_BIN_OP_SR_uxn_device_h_l59_c14_1e60_return_output;
     -- BIN_OP_AND[uxn_device_h_l59_c14_76f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c14_76f8_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_left;
     BIN_OP_AND_uxn_device_h_l59_c14_76f8_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output := BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output;

     -- Submodule level 4
     VAR_is_event_uxn_device_h_l59_c2_2d71 := VAR_BIN_OP_AND_uxn_device_h_l59_c14_76f8_return_output;
     VAR_MUX_uxn_device_h_l60_c10_46c1_cond := resize(VAR_is_event_uxn_device_h_l59_c2_2d71, 1);
     REG_VAR_is_event := VAR_is_event_uxn_device_h_l59_c2_2d71;
     -- MUX[uxn_device_h_l60_c10_46c1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l60_c10_46c1_cond <= VAR_MUX_uxn_device_h_l60_c10_46c1_cond;
     MUX_uxn_device_h_l60_c10_46c1_iftrue <= VAR_MUX_uxn_device_h_l60_c10_46c1_iftrue;
     MUX_uxn_device_h_l60_c10_46c1_iffalse <= VAR_MUX_uxn_device_h_l60_c10_46c1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l60_c10_46c1_return_output := MUX_uxn_device_h_l60_c10_46c1_return_output;

     -- Submodule level 5
     VAR_put_stack_uxn_device_h_l61_c2_5295_value := VAR_MUX_uxn_device_h_l60_c10_46c1_return_output;
     REG_VAR_value := VAR_MUX_uxn_device_h_l60_c10_46c1_return_output;
     -- put_stack[uxn_device_h_l61_c2_5295] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l61_c2_5295_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l61_c2_5295_stack_index <= VAR_put_stack_uxn_device_h_l61_c2_5295_stack_index;
     put_stack_uxn_device_h_l61_c2_5295_offset <= VAR_put_stack_uxn_device_h_l61_c2_5295_offset;
     put_stack_uxn_device_h_l61_c2_5295_value <= VAR_put_stack_uxn_device_h_l61_c2_5295_value;
     -- Outputs

   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_dei_mask <= REG_VAR_dei_mask;
REG_COMB_is_event <= REG_VAR_is_event;
REG_COMB_value <= REG_VAR_value;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     dei_mask <= REG_COMB_dei_mask;
     is_event <= REG_COMB_is_event;
     value <= REG_COMB_value;
 end if;
 end if;
end process;

end arch;
