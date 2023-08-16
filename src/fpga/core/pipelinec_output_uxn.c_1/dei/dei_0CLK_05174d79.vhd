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
entity dei_0CLK_05174d79 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_offset : in unsigned(7 downto 0);
 addr : in unsigned(7 downto 0));
end dei_0CLK_05174d79;
architecture arch of dei_0CLK_05174d79 is
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
-- CONST_SR_4[uxn_device_h_l59_c23_0206]
signal CONST_SR_4_uxn_device_h_l59_c23_0206_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l59_c23_0206_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_c87f]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c39_d755]
signal BIN_OP_AND_uxn_device_h_l59_c39_d755_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_d755_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l59_c14_22bd]
signal BIN_OP_SR_uxn_device_h_l59_c14_22bd_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_22bd_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l59_c14_2d71]
signal BIN_OP_AND_uxn_device_h_l59_c14_2d71_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_2d71_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output : unsigned(15 downto 0);

-- uxn_dei[uxn_device_h_l60_c21_9f47]
signal uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_9f47_addr : unsigned(7 downto 0);
signal uxn_dei_uxn_device_h_l60_c21_9f47_return_output : unsigned(7 downto 0);

-- peek_dev[uxn_device_h_l60_c37_52bc]
signal peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l60_c37_52bc_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l60_c37_52bc_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l60_c10_9795]
signal MUX_uxn_device_h_l60_c10_9795_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l60_c10_9795_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_9795_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l60_c10_9795_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l61_c2_0ef5]
signal put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_0ef5_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l61_c2_0ef5_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l61_c2_0ef5_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_uxn_device_h_l59_c23_0206
CONST_SR_4_uxn_device_h_l59_c23_0206 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l59_c23_0206_x,
CONST_SR_4_uxn_device_h_l59_c23_0206_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c39_d755
BIN_OP_AND_uxn_device_h_l59_c39_d755 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c39_d755_left,
BIN_OP_AND_uxn_device_h_l59_c39_d755_right,
BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output);

-- BIN_OP_SR_uxn_device_h_l59_c14_22bd
BIN_OP_SR_uxn_device_h_l59_c14_22bd : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l59_c14_22bd_left,
BIN_OP_SR_uxn_device_h_l59_c14_22bd_right,
BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output);

-- BIN_OP_AND_uxn_device_h_l59_c14_2d71
BIN_OP_AND_uxn_device_h_l59_c14_2d71 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l59_c14_2d71_left,
BIN_OP_AND_uxn_device_h_l59_c14_2d71_right,
BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output);

-- uxn_dei_uxn_device_h_l60_c21_9f47
uxn_dei_uxn_device_h_l60_c21_9f47 : entity work.uxn_dei_0CLK_794db3df port map (
clk,
uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE,
uxn_dei_uxn_device_h_l60_c21_9f47_addr,
uxn_dei_uxn_device_h_l60_c21_9f47_return_output);

-- peek_dev_uxn_device_h_l60_c37_52bc
peek_dev_uxn_device_h_l60_c37_52bc : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE,
peek_dev_uxn_device_h_l60_c37_52bc_address,
peek_dev_uxn_device_h_l60_c37_52bc_return_output);

-- MUX_uxn_device_h_l60_c10_9795
MUX_uxn_device_h_l60_c10_9795 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l60_c10_9795_cond,
MUX_uxn_device_h_l60_c10_9795_iftrue,
MUX_uxn_device_h_l60_c10_9795_iffalse,
MUX_uxn_device_h_l60_c10_9795_return_output);

-- put_stack_uxn_device_h_l61_c2_0ef5
put_stack_uxn_device_h_l61_c2_0ef5 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE,
put_stack_uxn_device_h_l61_c2_0ef5_stack_index,
put_stack_uxn_device_h_l61_c2_0ef5_offset,
put_stack_uxn_device_h_l61_c2_0ef5_value);



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
 CONST_SR_4_uxn_device_h_l59_c23_0206_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output,
 BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output,
 BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output,
 BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output,
 uxn_dei_uxn_device_h_l60_c21_9f47_return_output,
 peek_dev_uxn_device_h_l60_c37_52bc_return_output,
 MUX_uxn_device_h_l60_c10_9795_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_offset : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_is_event_uxn_device_h_l59_c2_b858 : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_9795_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_9795_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_9795_iffalse : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_9f47_addr : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l60_c21_9f47_return_output : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_52bc_address : unsigned(7 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l60_c37_52bc_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l60_c10_9795_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_0ef5_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_0ef5_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_0ef5_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_right := to_unsigned(15, 4);

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
     VAR_peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_left := VAR_addr;
     VAR_peek_dev_uxn_device_h_l60_c37_52bc_address := VAR_addr;
     VAR_uxn_dei_uxn_device_h_l60_c21_9f47_addr := VAR_addr;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0 := dei_mask;
     REG_VAR_dei_mask := dei_mask;
     VAR_put_stack_uxn_device_h_l61_c2_0ef5_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l61_c2_0ef5_offset := VAR_stack_offset;
     VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_x := value;
     -- peek_dev[uxn_device_h_l60_c37_52bc] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l60_c37_52bc_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l60_c37_52bc_address <= VAR_peek_dev_uxn_device_h_l60_c37_52bc_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l60_c37_52bc_return_output := peek_dev_uxn_device_h_l60_c37_52bc_return_output;

     -- uxn_dei[uxn_device_h_l60_c21_9f47] LATENCY=0
     -- Clock enable
     uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE <= VAR_uxn_dei_uxn_device_h_l60_c21_9f47_CLOCK_ENABLE;
     -- Inputs
     uxn_dei_uxn_device_h_l60_c21_9f47_addr <= VAR_uxn_dei_uxn_device_h_l60_c21_9f47_addr;
     -- Outputs
     VAR_uxn_dei_uxn_device_h_l60_c21_9f47_return_output := uxn_dei_uxn_device_h_l60_c21_9f47_return_output;

     -- BIN_OP_AND[uxn_device_h_l59_c39_d755] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c39_d755_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_left;
     BIN_OP_AND_uxn_device_h_l59_c39_d755_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output := BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output;

     -- CONST_SR_4[uxn_device_h_l59_c23_0206] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l59_c23_0206_x <= VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_return_output := CONST_SR_4_uxn_device_h_l59_c23_0206_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_right := VAR_BIN_OP_AND_uxn_device_h_l59_c39_d755_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l59_c23_0206_return_output, 4);
     VAR_MUX_uxn_device_h_l60_c10_9795_iffalse := VAR_peek_dev_uxn_device_h_l60_c37_52bc_return_output;
     VAR_MUX_uxn_device_h_l60_c10_9795_iftrue := VAR_uxn_dei_uxn_device_h_l60_c21_9f47_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l59_c14_c87f] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l59_c14_c87f_return_output;
     -- BIN_OP_SR[uxn_device_h_l59_c14_22bd] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l59_c14_22bd_left <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_left;
     BIN_OP_SR_uxn_device_h_l59_c14_22bd_right <= VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output := BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_left := VAR_BIN_OP_SR_uxn_device_h_l59_c14_22bd_return_output;
     -- BIN_OP_AND[uxn_device_h_l59_c14_2d71] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l59_c14_2d71_left <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_left;
     BIN_OP_AND_uxn_device_h_l59_c14_2d71_right <= VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output := BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output;

     -- Submodule level 4
     VAR_is_event_uxn_device_h_l59_c2_b858 := VAR_BIN_OP_AND_uxn_device_h_l59_c14_2d71_return_output;
     VAR_MUX_uxn_device_h_l60_c10_9795_cond := resize(VAR_is_event_uxn_device_h_l59_c2_b858, 1);
     REG_VAR_is_event := VAR_is_event_uxn_device_h_l59_c2_b858;
     -- MUX[uxn_device_h_l60_c10_9795] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l60_c10_9795_cond <= VAR_MUX_uxn_device_h_l60_c10_9795_cond;
     MUX_uxn_device_h_l60_c10_9795_iftrue <= VAR_MUX_uxn_device_h_l60_c10_9795_iftrue;
     MUX_uxn_device_h_l60_c10_9795_iffalse <= VAR_MUX_uxn_device_h_l60_c10_9795_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l60_c10_9795_return_output := MUX_uxn_device_h_l60_c10_9795_return_output;

     -- Submodule level 5
     VAR_put_stack_uxn_device_h_l61_c2_0ef5_value := VAR_MUX_uxn_device_h_l60_c10_9795_return_output;
     REG_VAR_value := VAR_MUX_uxn_device_h_l60_c10_9795_return_output;
     -- put_stack[uxn_device_h_l61_c2_0ef5] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l61_c2_0ef5_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l61_c2_0ef5_stack_index <= VAR_put_stack_uxn_device_h_l61_c2_0ef5_stack_index;
     put_stack_uxn_device_h_l61_c2_0ef5_offset <= VAR_put_stack_uxn_device_h_l61_c2_0ef5_offset;
     put_stack_uxn_device_h_l61_c2_0ef5_value <= VAR_put_stack_uxn_device_h_l61_c2_0ef5_value;
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
