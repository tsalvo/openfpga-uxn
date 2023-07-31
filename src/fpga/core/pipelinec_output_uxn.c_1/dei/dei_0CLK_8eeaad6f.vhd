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
entity dei_0CLK_8eeaad6f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 stack_offset : in unsigned(7 downto 0);
 addr : in unsigned(7 downto 0));
end dei_0CLK_8eeaad6f;
architecture arch of dei_0CLK_8eeaad6f is
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
-- CONST_SR_4[uxn_device_h_l57_c23_72e3]
signal CONST_SR_4_uxn_device_h_l57_c23_72e3_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output : unsigned(7 downto 0);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l57_c14_7b61]
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0 : uint16_t_16;
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0 : unsigned(3 downto 0);
signal VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c39_739f]
signal BIN_OP_AND_uxn_device_h_l57_c39_739f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c39_739f_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_device_h_l57_c14_5010]
signal BIN_OP_SR_uxn_device_h_l57_c14_5010_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_device_h_l57_c14_5010_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c14_23c4]
signal BIN_OP_AND_uxn_device_h_l57_c14_23c4_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c14_23c4_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output : unsigned(15 downto 0);

-- uxn_dei[uxn_device_h_l58_c21_16e5]
signal uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal uxn_dei_uxn_device_h_l58_c21_16e5_addr : unsigned(7 downto 0);
signal uxn_dei_uxn_device_h_l58_c21_16e5_return_output : unsigned(7 downto 0);

-- device_ram_read[uxn_device_h_l58_c37_f1b2]
signal device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_read_uxn_device_h_l58_c37_f1b2_address : unsigned(7 downto 0);
signal device_ram_read_uxn_device_h_l58_c37_f1b2_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l58_c10_71fc]
signal MUX_uxn_device_h_l58_c10_71fc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l58_c10_71fc_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l58_c10_71fc_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l58_c10_71fc_return_output : unsigned(7 downto 0);

-- put_stack[uxn_device_h_l59_c2_ee61]
signal put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l59_c2_ee61_stack_index : unsigned(0 downto 0);
signal put_stack_uxn_device_h_l59_c2_ee61_offset : unsigned(7 downto 0);
signal put_stack_uxn_device_h_l59_c2_ee61_value : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- CONST_SR_4_uxn_device_h_l57_c23_72e3
CONST_SR_4_uxn_device_h_l57_c23_72e3 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l57_c23_72e3_x,
CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output);

-- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61 : entity work.VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_0CLK_763c90e8 port map (
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0,
VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c39_739f
BIN_OP_AND_uxn_device_h_l57_c39_739f : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c39_739f_left,
BIN_OP_AND_uxn_device_h_l57_c39_739f_right,
BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output);

-- BIN_OP_SR_uxn_device_h_l57_c14_5010
BIN_OP_SR_uxn_device_h_l57_c14_5010 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_device_h_l57_c14_5010_left,
BIN_OP_SR_uxn_device_h_l57_c14_5010_right,
BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c14_23c4
BIN_OP_AND_uxn_device_h_l57_c14_23c4 : entity work.BIN_OP_AND_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c14_23c4_left,
BIN_OP_AND_uxn_device_h_l57_c14_23c4_right,
BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output);

-- uxn_dei_uxn_device_h_l58_c21_16e5
uxn_dei_uxn_device_h_l58_c21_16e5 : entity work.uxn_dei_0CLK_fb917810 port map (
clk,
uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE,
uxn_dei_uxn_device_h_l58_c21_16e5_addr,
uxn_dei_uxn_device_h_l58_c21_16e5_return_output);

-- device_ram_read_uxn_device_h_l58_c37_f1b2
device_ram_read_uxn_device_h_l58_c37_f1b2 : entity work.device_ram_read_0CLK_8ab28aec port map (
clk,
device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE,
device_ram_read_uxn_device_h_l58_c37_f1b2_address,
device_ram_read_uxn_device_h_l58_c37_f1b2_return_output);

-- MUX_uxn_device_h_l58_c10_71fc
MUX_uxn_device_h_l58_c10_71fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l58_c10_71fc_cond,
MUX_uxn_device_h_l58_c10_71fc_iftrue,
MUX_uxn_device_h_l58_c10_71fc_iffalse,
MUX_uxn_device_h_l58_c10_71fc_return_output);

-- put_stack_uxn_device_h_l59_c2_ee61
put_stack_uxn_device_h_l59_c2_ee61 : entity work.put_stack_0CLK_5f39ecad port map (
clk,
put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE,
put_stack_uxn_device_h_l59_c2_ee61_stack_index,
put_stack_uxn_device_h_l59_c2_ee61_offset,
put_stack_uxn_device_h_l59_c2_ee61_value);



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
 CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output,
 VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output,
 BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output,
 BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output,
 BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output,
 uxn_dei_uxn_device_h_l58_c21_16e5_return_output,
 device_ram_read_uxn_device_h_l58_c37_f1b2_return_output,
 MUX_uxn_device_h_l58_c10_71fc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_stack_offset : unsigned(7 downto 0);
 variable VAR_addr : unsigned(7 downto 0);
 variable VAR_is_event_uxn_device_h_l57_c2_def0 : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_x : unsigned(7 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0 : unsigned(3 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_left : unsigned(15 downto 0);
 variable VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0 : uint16_t_16;
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c10_71fc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c10_71fc_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c10_71fc_iffalse : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l58_c21_16e5_addr : unsigned(7 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_uxn_dei_uxn_device_h_l58_c21_16e5_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_address : unsigned(7 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l58_c10_71fc_return_output : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l59_c2_ee61_stack_index : unsigned(0 downto 0);
 variable VAR_put_stack_uxn_device_h_l59_c2_ee61_offset : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l59_c2_ee61_value : unsigned(7 downto 0);
 variable VAR_put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE : unsigned(0 downto 0);
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
     VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_right := to_unsigned(15, 4);
     VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_right := to_unsigned(1, 1);

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
     VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_left := VAR_addr;
     VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_address := VAR_addr;
     VAR_uxn_dei_uxn_device_h_l58_c21_16e5_addr := VAR_addr;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0 := dei_mask;
     REG_VAR_dei_mask := dei_mask;
     VAR_put_stack_uxn_device_h_l59_c2_ee61_stack_index := VAR_stack_index;
     VAR_put_stack_uxn_device_h_l59_c2_ee61_offset := VAR_stack_offset;
     VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_x := value;
     -- CONST_SR_4[uxn_device_h_l57_c23_72e3] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l57_c23_72e3_x <= VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output := CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output;

     -- uxn_dei[uxn_device_h_l58_c21_16e5] LATENCY=0
     -- Clock enable
     uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE <= VAR_uxn_dei_uxn_device_h_l58_c21_16e5_CLOCK_ENABLE;
     -- Inputs
     uxn_dei_uxn_device_h_l58_c21_16e5_addr <= VAR_uxn_dei_uxn_device_h_l58_c21_16e5_addr;
     -- Outputs
     VAR_uxn_dei_uxn_device_h_l58_c21_16e5_return_output := uxn_dei_uxn_device_h_l58_c21_16e5_return_output;

     -- device_ram_read[uxn_device_h_l58_c37_f1b2] LATENCY=0
     -- Clock enable
     device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE <= VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_CLOCK_ENABLE;
     -- Inputs
     device_ram_read_uxn_device_h_l58_c37_f1b2_address <= VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_address;
     -- Outputs
     VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_return_output := device_ram_read_uxn_device_h_l58_c37_f1b2_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c39_739f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c39_739f_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_left;
     BIN_OP_AND_uxn_device_h_l57_c39_739f_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output := BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_right := VAR_BIN_OP_AND_uxn_device_h_l57_c39_739f_return_output;
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0 := resize(VAR_CONST_SR_4_uxn_device_h_l57_c23_72e3_return_output, 4);
     VAR_MUX_uxn_device_h_l58_c10_71fc_iffalse := VAR_device_ram_read_uxn_device_h_l58_c37_f1b2_return_output;
     VAR_MUX_uxn_device_h_l58_c10_71fc_iftrue := VAR_uxn_dei_uxn_device_h_l58_c21_16e5_return_output;
     -- VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d[uxn_device_h_l57_c14_7b61] LATENCY=0
     -- Inputs
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_ref_toks_0;
     VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0 <= VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_var_dim_0;
     -- Outputs
     VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output := VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_left := VAR_VAR_REF_RD_uint16_t_uint16_t_16_VAR_d41d_uxn_device_h_l57_c14_7b61_return_output;
     -- BIN_OP_SR[uxn_device_h_l57_c14_5010] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_device_h_l57_c14_5010_left <= VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_left;
     BIN_OP_SR_uxn_device_h_l57_c14_5010_right <= VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output := BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output;

     -- Submodule level 3
     VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_left := VAR_BIN_OP_SR_uxn_device_h_l57_c14_5010_return_output;
     -- BIN_OP_AND[uxn_device_h_l57_c14_23c4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c14_23c4_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_left;
     BIN_OP_AND_uxn_device_h_l57_c14_23c4_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output := BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output;

     -- Submodule level 4
     VAR_is_event_uxn_device_h_l57_c2_def0 := VAR_BIN_OP_AND_uxn_device_h_l57_c14_23c4_return_output;
     VAR_MUX_uxn_device_h_l58_c10_71fc_cond := resize(VAR_is_event_uxn_device_h_l57_c2_def0, 1);
     REG_VAR_is_event := VAR_is_event_uxn_device_h_l57_c2_def0;
     -- MUX[uxn_device_h_l58_c10_71fc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l58_c10_71fc_cond <= VAR_MUX_uxn_device_h_l58_c10_71fc_cond;
     MUX_uxn_device_h_l58_c10_71fc_iftrue <= VAR_MUX_uxn_device_h_l58_c10_71fc_iftrue;
     MUX_uxn_device_h_l58_c10_71fc_iffalse <= VAR_MUX_uxn_device_h_l58_c10_71fc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l58_c10_71fc_return_output := MUX_uxn_device_h_l58_c10_71fc_return_output;

     -- Submodule level 5
     VAR_put_stack_uxn_device_h_l59_c2_ee61_value := VAR_MUX_uxn_device_h_l58_c10_71fc_return_output;
     REG_VAR_value := VAR_MUX_uxn_device_h_l58_c10_71fc_return_output;
     -- put_stack[uxn_device_h_l59_c2_ee61] LATENCY=0
     -- Clock enable
     put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE <= VAR_put_stack_uxn_device_h_l59_c2_ee61_CLOCK_ENABLE;
     -- Inputs
     put_stack_uxn_device_h_l59_c2_ee61_stack_index <= VAR_put_stack_uxn_device_h_l59_c2_ee61_stack_index;
     put_stack_uxn_device_h_l59_c2_ee61_offset <= VAR_put_stack_uxn_device_h_l59_c2_ee61_offset;
     put_stack_uxn_device_h_l59_c2_ee61_value <= VAR_put_stack_uxn_device_h_l59_c2_ee61_value;
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
