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
-- Submodules: 67
entity deo_0CLK_0f1297eb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_0f1297eb;
architecture arch of deo_0CLK_0f1297eb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l489_c6_3de7]
signal BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l489_c1_cb4b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l494_c7_1d51]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l489_c2_4572]
signal n8_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l489_c2_4572]
signal t8_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l489_c2_4572]
signal result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(15 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l489_c2_4572]
signal device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output : device_out_result_t;

-- printf_uxn_opcodes_h_l490_c3_1547[uxn_opcodes_h_l490_c3_1547]
signal printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l494_c11_1d97]
signal BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l497_c7_3392]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l494_c7_1d51]
signal n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l494_c7_1d51]
signal t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l494_c7_1d51]
signal result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(15 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l494_c7_1d51]
signal device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l497_c11_d326]
signal BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_37ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l497_c7_3392]
signal n8_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l497_c7_3392]
signal t8_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l497_c7_3392]
signal result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(15 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l497_c7_3392]
signal device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output : device_out_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_e933]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l505_c1_8df0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c7_37ba]
signal n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : signed(3 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(23 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(23 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l500_c7_37ba]
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(15 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_37ba]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : device_out_result_t;

-- sp_relative_shift[uxn_opcodes_h_l503_c30_05db]
signal sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l507_c42_1361]
signal BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l507_c23_46fe]
signal device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l507_c23_46fe_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f727( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.vram_address := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_sp_shift := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;
      base.u16_value := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7
BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left,
BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right,
BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- n8_MUX_uxn_opcodes_h_l489_c2_4572
n8_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l489_c2_4572_cond,
n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- t8_MUX_uxn_opcodes_h_l489_c2_4572
t8_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l489_c2_4572_cond,
t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572
result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572
result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572
result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572
result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572
result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572
result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572
result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572
result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572
result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572
result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond,
result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l489_c2_4572
device_out_result_MUX_uxn_opcodes_h_l489_c2_4572 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond,
device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue,
device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse,
device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

-- printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547
printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547 : entity work.printf_uxn_opcodes_h_l490_c3_1547_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97
BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left,
BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right,
BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- n8_MUX_uxn_opcodes_h_l494_c7_1d51
n8_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- t8_MUX_uxn_opcodes_h_l494_c7_1d51
t8_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51
result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51
result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51
result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51
result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51
result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51
result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51
result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51
result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51
result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51
result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51
device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond,
device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue,
device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse,
device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326
BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left,
BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right,
BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- n8_MUX_uxn_opcodes_h_l497_c7_3392
n8_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l497_c7_3392_cond,
n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- t8_MUX_uxn_opcodes_h_l497_c7_3392
t8_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l497_c7_3392_cond,
t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392
result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392
result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392
result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392
result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392
result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392
result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392
result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392
result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392
result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392
result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond,
result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l497_c7_3392
device_out_result_MUX_uxn_opcodes_h_l497_c7_3392 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond,
device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue,
device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse,
device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933
BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_37ba
n8_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba
result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint24_t_uint24_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba
result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba
result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba
device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output);

-- sp_relative_shift_uxn_opcodes_h_l503_c30_05db
sp_relative_shift_uxn_opcodes_h_l503_c30_05db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins,
sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x,
sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y,
sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361
BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left,
BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right,
BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output);

-- device_out_uxn_opcodes_h_l507_c23_46fe
device_out_uxn_opcodes_h_l507_c23_46fe : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l507_c23_46fe_device_address,
device_out_uxn_opcodes_h_l507_c23_46fe_value,
device_out_uxn_opcodes_h_l507_c23_46fe_phase,
device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read,
device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read,
device_out_uxn_opcodes_h_l507_c23_46fe_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output,
 sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output,
 device_out_uxn_opcodes_h_l507_c23_46fe_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c3_d919 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l495_c3_88dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l494_c7_1d51_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(23 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l508_c32_f537_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l509_c31_313a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l510_c21_5715_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l511_c22_b0db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l512_c26_8938_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_c29_f389_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l514_c25_376a_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l515_c24_b0d3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l518_l484_DUPLICATE_10b6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c3_d919 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l491_c3_d919;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l495_c3_88dd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l495_c3_88dd;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right := to_unsigned(4, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l494_c7_1d51_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99 LATENCY=0
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l489_c6_3de7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_left;
     BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output := BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l507_c42_1361] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_left;
     BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output := BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_e933] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l494_c11_1d97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_left;
     BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output := BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l497_c11_d326] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_left;
     BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output := BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output := result.is_device_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l503_c30_05db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_ins;
     sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_x;
     sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output := sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output := result.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output := result.u16_value;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l489_c6_3de7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l494_c11_1d97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l497_c11_d326_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_e933_return_output;
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l507_c42_1361_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_5288_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_fea3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l500_l494_l497_DUPLICATE_dc97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l489_l494_l497_DUPLICATE_7bdb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_f039_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_160f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_cf99_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_b1b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l500_l489_l494_l497_DUPLICATE_6048_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l503_c30_05db_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- t8_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output := t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l489_c1_cb4b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l489_c1_cb4b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_t8_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- n8_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output := n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- t8_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- printf_uxn_opcodes_h_l490_c3_1547[uxn_opcodes_h_l490_c3_1547] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l490_c3_1547_uxn_opcodes_h_l490_c3_1547_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_n8_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_t8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- t8_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output := t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- n8_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_n8_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l489_c2_4572_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l505_c1_8df0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output;

     -- n8_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output := n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- Submodule level 5
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l505_c1_8df0_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l489_c2_4572_return_output;
     -- device_out[uxn_opcodes_h_l507_c23_46fe] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l507_c23_46fe_device_address <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_device_address;
     device_out_uxn_opcodes_h_l507_c23_46fe_value <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_value;
     device_out_uxn_opcodes_h_l507_c23_46fe_phase <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_phase;
     device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_device_ram_read;
     device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l507_c23_46fe_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output := device_out_uxn_opcodes_h_l507_c23_46fe_return_output;

     -- Submodule level 6
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output;
     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l508_c32_f537] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l508_c32_f537_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l514_c25_376a] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l514_c25_376a_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l510_c21_5715] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l510_c21_5715_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.u8_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l509_c31_313a] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l509_c31_313a_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l511_c22_b0db] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l511_c22_b0db_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l512_c26_8938] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l512_c26_8938_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.is_vram_write;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l515_c24_b0d3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l515_c24_b0d3_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l513_c29_f389] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_c29_f389_return_output := VAR_device_out_uxn_opcodes_h_l507_c23_46fe_return_output.vram_write_layer;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l511_c22_b0db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l515_c24_b0d3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l508_c32_f537_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l512_c26_8938_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l513_c29_f389_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint24_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l514_c25_376a_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l509_c31_313a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l510_c21_5715_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_37ba] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output := device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- Submodule level 8
     VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_37ba_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l497_c7_3392] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l497_c7_3392_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output := device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l494_c7_1d51] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_cond;
     result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output := result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;

     -- Submodule level 10
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l489_c2_4572_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l494_c7_1d51_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l489_c2_4572] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l518_l484_DUPLICATE_10b6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l518_l484_DUPLICATE_10b6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f727(
     result,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l489_c2_4572_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l489_c2_4572_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l518_l484_DUPLICATE_10b6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f727_uxn_opcodes_h_l518_l484_DUPLICATE_10b6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
