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
-- Submodules: 22
entity device_in_0CLK_c062f1e5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 stack_ptr0 : in unsigned(7 downto 0);
 stack_ptr1 : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_c062f1e5;
architecture arch of device_in_0CLK_c062f1e5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l606_c11_e179]
signal BIN_OP_AND_uxn_device_h_l606_c11_e179_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l606_c11_e179_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l608_c6_ed3e]
signal BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l608_c1_9b5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c7_5e98]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l608_c2_fdfb]
signal result_MUX_uxn_device_h_l608_c2_fdfb_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l608_c2_fdfb_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l608_c2_fdfb_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l608_c2_fdfb_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l609_c12_3eb5]
signal system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1 : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l609_c12_3eb5_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l611_c11_2ef3]
signal BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_c02e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_d498]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l611_c7_5e98]
signal result_MUX_uxn_device_h_l611_c7_5e98_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l611_c7_5e98_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c7_5e98_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l611_c7_5e98_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l612_c12_d87c]
signal screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l612_c12_d87c_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_d87c_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l612_c12_d87c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l614_c11_2ee6]
signal BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_7057]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_ea7c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l614_c7_d498]
signal result_MUX_uxn_device_h_l614_c7_d498_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l614_c7_d498_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_d498_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l614_c7_d498_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l615_c12_830d]
signal controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l615_c12_830d_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_830d_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l615_c12_830d_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l617_c11_21c1]
signal BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_278e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_9245]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l617_c7_ea7c]
signal result_MUX_uxn_device_h_l617_c7_ea7c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l617_c7_ea7c_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_ea7c_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l617_c7_ea7c_return_output : device_in_result_t;

-- datetime_dei[uxn_device_h_l618_c12_dc18]
signal datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_dc18_device_address : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_dc18_phase : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l618_c12_dc18_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l621_c12_c76e]
signal generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l621_c12_c76e_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_c76e_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l621_c12_c76e_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l606_c11_e179
BIN_OP_AND_uxn_device_h_l606_c11_e179 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l606_c11_e179_left,
BIN_OP_AND_uxn_device_h_l606_c11_e179_right,
BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output);

-- BIN_OP_EQ_uxn_device_h_l608_c6_ed3e
BIN_OP_EQ_uxn_device_h_l608_c6_ed3e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left,
BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right,
BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output);

-- result_MUX_uxn_device_h_l608_c2_fdfb
result_MUX_uxn_device_h_l608_c2_fdfb : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l608_c2_fdfb_cond,
result_MUX_uxn_device_h_l608_c2_fdfb_iftrue,
result_MUX_uxn_device_h_l608_c2_fdfb_iffalse,
result_MUX_uxn_device_h_l608_c2_fdfb_return_output);

-- system_dei_uxn_device_h_l609_c12_3eb5
system_dei_uxn_device_h_l609_c12_3eb5 : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE,
system_dei_uxn_device_h_l609_c12_3eb5_device_address,
system_dei_uxn_device_h_l609_c12_3eb5_phase,
system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0,
system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1,
system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read,
system_dei_uxn_device_h_l609_c12_3eb5_return_output);

-- BIN_OP_EQ_uxn_device_h_l611_c11_2ef3
BIN_OP_EQ_uxn_device_h_l611_c11_2ef3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left,
BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right,
BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output);

-- result_MUX_uxn_device_h_l611_c7_5e98
result_MUX_uxn_device_h_l611_c7_5e98 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l611_c7_5e98_cond,
result_MUX_uxn_device_h_l611_c7_5e98_iftrue,
result_MUX_uxn_device_h_l611_c7_5e98_iffalse,
result_MUX_uxn_device_h_l611_c7_5e98_return_output);

-- screen_dei_uxn_device_h_l612_c12_d87c
screen_dei_uxn_device_h_l612_c12_d87c : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE,
screen_dei_uxn_device_h_l612_c12_d87c_device_address,
screen_dei_uxn_device_h_l612_c12_d87c_phase,
screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read,
screen_dei_uxn_device_h_l612_c12_d87c_return_output);

-- BIN_OP_EQ_uxn_device_h_l614_c11_2ee6
BIN_OP_EQ_uxn_device_h_l614_c11_2ee6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left,
BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right,
BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output);

-- result_MUX_uxn_device_h_l614_c7_d498
result_MUX_uxn_device_h_l614_c7_d498 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l614_c7_d498_cond,
result_MUX_uxn_device_h_l614_c7_d498_iftrue,
result_MUX_uxn_device_h_l614_c7_d498_iffalse,
result_MUX_uxn_device_h_l614_c7_d498_return_output);

-- controller_dei_uxn_device_h_l615_c12_830d
controller_dei_uxn_device_h_l615_c12_830d : entity work.controller_dei_0CLK_336c9a77 port map (
clk,
controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE,
controller_dei_uxn_device_h_l615_c12_830d_device_address,
controller_dei_uxn_device_h_l615_c12_830d_phase,
controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons,
controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read,
controller_dei_uxn_device_h_l615_c12_830d_return_output);

-- BIN_OP_EQ_uxn_device_h_l617_c11_21c1
BIN_OP_EQ_uxn_device_h_l617_c11_21c1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left,
BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right,
BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output);

-- result_MUX_uxn_device_h_l617_c7_ea7c
result_MUX_uxn_device_h_l617_c7_ea7c : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l617_c7_ea7c_cond,
result_MUX_uxn_device_h_l617_c7_ea7c_iftrue,
result_MUX_uxn_device_h_l617_c7_ea7c_iffalse,
result_MUX_uxn_device_h_l617_c7_ea7c_return_output);

-- datetime_dei_uxn_device_h_l618_c12_dc18
datetime_dei_uxn_device_h_l618_c12_dc18 : entity work.datetime_dei_0CLK_24541ec2 port map (
clk,
datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l618_c12_dc18_device_address,
datetime_dei_uxn_device_h_l618_c12_dc18_phase,
datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read,
datetime_dei_uxn_device_h_l618_c12_dc18_return_output);

-- generic_dei_uxn_device_h_l621_c12_c76e
generic_dei_uxn_device_h_l621_c12_c76e : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE,
generic_dei_uxn_device_h_l621_c12_c76e_device_address,
generic_dei_uxn_device_h_l621_c12_c76e_phase,
generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read,
generic_dei_uxn_device_h_l621_c12_c76e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 stack_ptr0,
 stack_ptr1,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output,
 BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output,
 result_MUX_uxn_device_h_l608_c2_fdfb_return_output,
 system_dei_uxn_device_h_l609_c12_3eb5_return_output,
 BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output,
 result_MUX_uxn_device_h_l611_c7_5e98_return_output,
 screen_dei_uxn_device_h_l612_c12_d87c_return_output,
 BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output,
 result_MUX_uxn_device_h_l614_c7_d498_return_output,
 controller_dei_uxn_device_h_l615_c12_830d_return_output,
 BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output,
 result_MUX_uxn_device_h_l617_c7_ea7c_return_output,
 datetime_dei_uxn_device_h_l618_c12_dc18_return_output,
 generic_dei_uxn_device_h_l621_c12_c76e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_5e98_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_fdfb_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l608_c2_fdfb_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1 : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l609_c12_3eb5_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l611_c7_5e98_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_5e98_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_d498_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l611_c7_5e98_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_d87c_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_d87c_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l612_c12_d87c_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l614_c7_d498_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_d498_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_ea7c_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l614_c7_d498_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l615_c12_830d_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l617_c7_ea7c_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_dc18_device_address : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_dc18_phase : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l618_c12_dc18_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l621_c12_c76e_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_c76e_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l621_c12_c76e_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right := to_unsigned(192, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_right := to_unsigned(240, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_stack_ptr0 := stack_ptr0;
     VAR_stack_ptr1 := stack_ptr1;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l615_c12_830d_device_address := VAR_device_address;
     VAR_datetime_dei_uxn_device_h_l618_c12_dc18_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l621_c12_c76e_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l612_c12_d87c_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l615_c12_830d_phase := VAR_phase;
     VAR_datetime_dei_uxn_device_h_l618_c12_dc18_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l621_c12_c76e_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l612_c12_d87c_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0 := VAR_stack_ptr0;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1 := VAR_stack_ptr1;
     -- BIN_OP_AND[uxn_device_h_l606_c11_e179] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l606_c11_e179_left <= VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_left;
     BIN_OP_AND_uxn_device_h_l606_c11_e179_right <= VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output := BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left := VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l606_c11_e179_return_output;
     -- BIN_OP_EQ[uxn_device_h_l614_c11_2ee6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_left;
     BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right <= VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output := BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l608_c6_ed3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left <= VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_left;
     BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right <= VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output := BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l617_c11_21c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_left;
     BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right <= VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output := BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l611_c11_2ef3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left <= VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_left;
     BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right <= VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output := BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output;
     VAR_result_MUX_uxn_device_h_l608_c2_fdfb_cond := VAR_BIN_OP_EQ_uxn_device_h_l608_c6_ed3e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output;
     VAR_result_MUX_uxn_device_h_l611_c7_5e98_cond := VAR_BIN_OP_EQ_uxn_device_h_l611_c11_2ef3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_d498_cond := VAR_BIN_OP_EQ_uxn_device_h_l614_c11_2ee6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_ea7c_cond := VAR_BIN_OP_EQ_uxn_device_h_l617_c11_21c1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l608_c1_9b5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c7_5e98] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c7_5e98_return_output;
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l608_c1_9b5d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c7_d498] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l611_c1_c02e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output;

     -- system_dei[uxn_device_h_l609_c12_3eb5] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l609_c12_3eb5_device_address <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_device_address;
     system_dei_uxn_device_h_l609_c12_3eb5_phase <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_phase;
     system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0 <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr0;
     system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1 <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_stack_ptr1;
     system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l609_c12_3eb5_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l609_c12_3eb5_return_output := system_dei_uxn_device_h_l609_c12_3eb5_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c7_d498_return_output;
     VAR_screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l611_c1_c02e_return_output;
     VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iftrue := VAR_system_dei_uxn_device_h_l609_c12_3eb5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l614_c1_7057] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c7_ea7c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output;

     -- screen_dei[uxn_device_h_l612_c12_d87c] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l612_c12_d87c_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l612_c12_d87c_device_address <= VAR_screen_dei_uxn_device_h_l612_c12_d87c_device_address;
     screen_dei_uxn_device_h_l612_c12_d87c_phase <= VAR_screen_dei_uxn_device_h_l612_c12_d87c_phase;
     screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l612_c12_d87c_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l612_c12_d87c_return_output := screen_dei_uxn_device_h_l612_c12_d87c_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c7_ea7c_return_output;
     VAR_controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l614_c1_7057_return_output;
     VAR_result_MUX_uxn_device_h_l611_c7_5e98_iftrue := VAR_screen_dei_uxn_device_h_l612_c12_d87c_return_output;
     -- controller_dei[uxn_device_h_l615_c12_830d] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l615_c12_830d_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l615_c12_830d_device_address <= VAR_controller_dei_uxn_device_h_l615_c12_830d_device_address;
     controller_dei_uxn_device_h_l615_c12_830d_phase <= VAR_controller_dei_uxn_device_h_l615_c12_830d_phase;
     controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons <= VAR_controller_dei_uxn_device_h_l615_c12_830d_controller0_buttons;
     controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l615_c12_830d_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l615_c12_830d_return_output := controller_dei_uxn_device_h_l615_c12_830d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l620_c1_9245] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l617_c1_278e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l620_c1_9245_return_output;
     VAR_datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l617_c1_278e_return_output;
     VAR_result_MUX_uxn_device_h_l614_c7_d498_iftrue := VAR_controller_dei_uxn_device_h_l615_c12_830d_return_output;
     -- datetime_dei[uxn_device_h_l618_c12_dc18] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l618_c12_dc18_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l618_c12_dc18_device_address <= VAR_datetime_dei_uxn_device_h_l618_c12_dc18_device_address;
     datetime_dei_uxn_device_h_l618_c12_dc18_phase <= VAR_datetime_dei_uxn_device_h_l618_c12_dc18_phase;
     datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read <= VAR_datetime_dei_uxn_device_h_l618_c12_dc18_previous_device_ram_read;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l618_c12_dc18_return_output := datetime_dei_uxn_device_h_l618_c12_dc18_return_output;

     -- generic_dei[uxn_device_h_l621_c12_c76e] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l621_c12_c76e_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l621_c12_c76e_device_address <= VAR_generic_dei_uxn_device_h_l621_c12_c76e_device_address;
     generic_dei_uxn_device_h_l621_c12_c76e_phase <= VAR_generic_dei_uxn_device_h_l621_c12_c76e_phase;
     generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l621_c12_c76e_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l621_c12_c76e_return_output := generic_dei_uxn_device_h_l621_c12_c76e_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iftrue := VAR_datetime_dei_uxn_device_h_l618_c12_dc18_return_output;
     VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iffalse := VAR_generic_dei_uxn_device_h_l621_c12_c76e_return_output;
     -- result_MUX[uxn_device_h_l617_c7_ea7c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l617_c7_ea7c_cond <= VAR_result_MUX_uxn_device_h_l617_c7_ea7c_cond;
     result_MUX_uxn_device_h_l617_c7_ea7c_iftrue <= VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iftrue;
     result_MUX_uxn_device_h_l617_c7_ea7c_iffalse <= VAR_result_MUX_uxn_device_h_l617_c7_ea7c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l617_c7_ea7c_return_output := result_MUX_uxn_device_h_l617_c7_ea7c_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l614_c7_d498_iffalse := VAR_result_MUX_uxn_device_h_l617_c7_ea7c_return_output;
     -- result_MUX[uxn_device_h_l614_c7_d498] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l614_c7_d498_cond <= VAR_result_MUX_uxn_device_h_l614_c7_d498_cond;
     result_MUX_uxn_device_h_l614_c7_d498_iftrue <= VAR_result_MUX_uxn_device_h_l614_c7_d498_iftrue;
     result_MUX_uxn_device_h_l614_c7_d498_iffalse <= VAR_result_MUX_uxn_device_h_l614_c7_d498_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l614_c7_d498_return_output := result_MUX_uxn_device_h_l614_c7_d498_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l611_c7_5e98_iffalse := VAR_result_MUX_uxn_device_h_l614_c7_d498_return_output;
     -- result_MUX[uxn_device_h_l611_c7_5e98] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l611_c7_5e98_cond <= VAR_result_MUX_uxn_device_h_l611_c7_5e98_cond;
     result_MUX_uxn_device_h_l611_c7_5e98_iftrue <= VAR_result_MUX_uxn_device_h_l611_c7_5e98_iftrue;
     result_MUX_uxn_device_h_l611_c7_5e98_iffalse <= VAR_result_MUX_uxn_device_h_l611_c7_5e98_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l611_c7_5e98_return_output := result_MUX_uxn_device_h_l611_c7_5e98_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iffalse := VAR_result_MUX_uxn_device_h_l611_c7_5e98_return_output;
     -- result_MUX[uxn_device_h_l608_c2_fdfb] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l608_c2_fdfb_cond <= VAR_result_MUX_uxn_device_h_l608_c2_fdfb_cond;
     result_MUX_uxn_device_h_l608_c2_fdfb_iftrue <= VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iftrue;
     result_MUX_uxn_device_h_l608_c2_fdfb_iffalse <= VAR_result_MUX_uxn_device_h_l608_c2_fdfb_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l608_c2_fdfb_return_output := result_MUX_uxn_device_h_l608_c2_fdfb_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l608_c2_fdfb_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l608_c2_fdfb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
