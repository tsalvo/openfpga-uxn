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
-- Submodules: 90
entity deo_0CLK_52d54777 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_52d54777;
architecture arch of deo_0CLK_52d54777 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l551_c6_adcc]
signal BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l551_c1_27b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_41cb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l551_c2_35ed]
signal device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l551_c2_35ed]
signal t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l551_c2_35ed]
signal n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l551_c2_35ed]
signal result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l552_c3_86e2[uxn_opcodes_h_l552_c3_86e2]
signal printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l557_c11_1ff2]
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l560_c7_6a63]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l557_c7_41cb]
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l557_c7_41cb]
signal t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l557_c7_41cb]
signal n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l557_c7_41cb]
signal result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l560_c11_4367]
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c7_e541]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l560_c7_6a63]
signal device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : device_out_result_t;

-- t8_MUX[uxn_opcodes_h_l560_c7_6a63]
signal t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l560_c7_6a63]
signal n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l560_c7_6a63]
signal result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l564_c11_14ae]
signal BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l567_c7_c85e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l564_c7_e541]
signal device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l564_c7_e541]
signal n8_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l564_c7_e541]
signal result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l567_c11_1696]
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l573_c1_4302]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output : unsigned(0 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l567_c7_c85e]
signal device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : device_out_result_t;

-- n8_MUX[uxn_opcodes_h_l567_c7_c85e]
signal n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(31 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);

-- result_device_ram_value_MUX[uxn_opcodes_h_l567_c7_c85e]
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
signal result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l571_c32_129b]
signal BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l571_c32_8c7a]
signal BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l571_c32_494a]
signal MUX_uxn_opcodes_h_l571_c32_494a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l571_c32_494a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l571_c32_494a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l571_c32_494a_return_output : signed(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l575_c42_99a8]
signal BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l575_c23_b8ae]
signal device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l575_c23_b8ae_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l575_c23_b8ae_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l575_c23_b8ae_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l575_c23_b8ae_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3eab( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : unsigned;
 ref_toks_12 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.vram_value := ref_toks_8;
      base.device_ram_address := ref_toks_9;
      base.is_device_ram_write := ref_toks_10;
      base.is_device_ram_read := ref_toks_11;
      base.device_ram_value := ref_toks_12;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc
BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left,
BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right,
BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed
device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- t8_MUX_uxn_opcodes_h_l551_c2_35ed
t8_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- n8_MUX_uxn_opcodes_h_l551_c2_35ed
n8_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed
result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed
result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed
result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed
result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed
result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

-- printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2
printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2 : entity work.printf_uxn_opcodes_h_l552_c3_86e2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2
BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right,
BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb
device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- t8_MUX_uxn_opcodes_h_l557_c7_41cb
t8_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- n8_MUX_uxn_opcodes_h_l557_c7_41cb
n8_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb
result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb
result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb
result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb
result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367
BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left,
BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right,
BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63
device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- t8_MUX_uxn_opcodes_h_l560_c7_6a63
t8_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- n8_MUX_uxn_opcodes_h_l560_c7_6a63
n8_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63
result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63
result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63
result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63
result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63
result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae
BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left,
BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right,
BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l564_c7_e541
device_out_result_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond,
device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- n8_MUX_uxn_opcodes_h_l564_c7_e541
n8_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l564_c7_e541_cond,
n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541
result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541
result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541
result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541
result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541
result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541
result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541
result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541
result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696
BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right,
BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e
device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- n8_MUX_uxn_opcodes_h_l567_c7_c85e
n8_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e
result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e
result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e
result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e
result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e
result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse,
result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l571_c32_129b
BIN_OP_AND_uxn_opcodes_h_l571_c32_129b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left,
BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right,
BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a
BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left,
BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right,
BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output);

-- MUX_uxn_opcodes_h_l571_c32_494a
MUX_uxn_opcodes_h_l571_c32_494a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l571_c32_494a_cond,
MUX_uxn_opcodes_h_l571_c32_494a_iftrue,
MUX_uxn_opcodes_h_l571_c32_494a_iffalse,
MUX_uxn_opcodes_h_l571_c32_494a_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8
BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left,
BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right,
BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output);

-- device_out_uxn_opcodes_h_l575_c23_b8ae
device_out_uxn_opcodes_h_l575_c23_b8ae : entity work.device_out_0CLK_67f1f799 port map (
clk,
device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l575_c23_b8ae_device_address,
device_out_uxn_opcodes_h_l575_c23_b8ae_value,
device_out_uxn_opcodes_h_l575_c23_b8ae_phase,
device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read,
device_out_uxn_opcodes_h_l575_c23_b8ae_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output,
 device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output,
 MUX_uxn_opcodes_h_l571_c32_494a_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output,
 device_out_uxn_opcodes_h_l575_c23_b8ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_b0ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7db4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l562_c3_aa77 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l565_c3_02e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l564_c7_e541_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l571_c32_494a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l571_c32_494a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l571_c32_494a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l571_c32_494a_return_output : signed(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_c32_ee0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l577_c31_d310_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_c31_0717_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l579_c29_217e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l580_c26_2699_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l581_c25_0c09_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l582_c23_e544_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l583_c24_c576_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3eab_uxn_opcodes_h_l586_l546_DUPLICATE_664c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l571_c32_494a_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7db4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l558_c3_7db4;
     VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_b0ac := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l554_c3_b0ac;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l571_c32_494a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l562_c3_aa77 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l562_c3_aa77;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l565_c3_02e3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l565_c3_02e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right := to_unsigned(3, 2);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := device_out_result;
     VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l567_c11_1696] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_left;
     BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output := BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l560_c11_4367] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_left;
     BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output := BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l564_c11_14ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output := result.vram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l571_c32_129b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_left;
     BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output := BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output := result.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output := result.is_stack_read;

     -- BIN_OP_MINUS[uxn_opcodes_h_l575_c42_99a8] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_left;
     BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output := BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l564_c7_e541_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l557_c11_1ff2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_left;
     BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output := BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_opcodes_h_l551_c6_adcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_left;
     BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output := BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output := result.is_device_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l571_c32_129b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l551_c6_adcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l557_c11_1ff2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l560_c11_4367_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l564_c11_14ae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l567_c11_1696_return_output;
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l575_c42_99a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_9834_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_1fb0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_0ae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_749e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l551_l564_l557_l560_DUPLICATE_cc6e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l567_l564_l557_l560_DUPLICATE_3451_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_510f_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_dfda_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_12a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_ea11_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l564_l567_l560_l557_l551_DUPLICATE_08ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l564_c7_e541_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l571_c32_8c7a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_left;
     BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output := BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l551_c1_27b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- t8_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- n8_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l571_c32_494a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l571_c32_8c7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l551_c1_27b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_n8_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- n8_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output := n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- printf_uxn_opcodes_h_l552_c3_86e2[uxn_opcodes_h_l552_c3_86e2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l552_c3_86e2_uxn_opcodes_h_l552_c3_86e2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- MUX[uxn_opcodes_h_l571_c32_494a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l571_c32_494a_cond <= VAR_MUX_uxn_opcodes_h_l571_c32_494a_cond;
     MUX_uxn_opcodes_h_l571_c32_494a_iftrue <= VAR_MUX_uxn_opcodes_h_l571_c32_494a_iftrue;
     MUX_uxn_opcodes_h_l571_c32_494a_iffalse <= VAR_MUX_uxn_opcodes_h_l571_c32_494a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l571_c32_494a_return_output := MUX_uxn_opcodes_h_l571_c32_494a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- t8_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue := VAR_MUX_uxn_opcodes_h_l571_c32_494a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_n8_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- n8_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- n8_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- n8_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l573_c1_4302] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output;

     -- Submodule level 6
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l573_c1_4302_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     -- device_out[uxn_opcodes_h_l575_c23_b8ae] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l575_c23_b8ae_device_address <= VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_device_address;
     device_out_uxn_opcodes_h_l575_c23_b8ae_value <= VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_value;
     device_out_uxn_opcodes_h_l575_c23_b8ae_phase <= VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_phase;
     device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_previous_device_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output := device_out_uxn_opcodes_h_l575_c23_b8ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- Submodule level 7
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d[uxn_opcodes_h_l579_c29_217e] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l579_c29_217e_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.device_ram_value;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l578_c31_0717] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_c31_0717_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.device_ram_address;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d[uxn_opcodes_h_l582_c23_e544] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l582_c23_e544_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.vram_value;

     -- device_out_result_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l576_c32_ee0c] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_c32_ee0c_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.is_device_ram_write;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l577_c31_d310] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l577_c31_d310_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l583_c24_c576] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l583_c24_c576_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.is_deo_done;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l581_c25_0c09] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l581_c25_0c09_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l580_c26_2699] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l580_c26_2699_return_output := VAR_device_out_uxn_opcodes_h_l575_c23_b8ae_return_output.is_vram_write;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l583_c24_c576_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l577_c31_d310_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l576_c32_ee0c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l580_c26_2699_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_opcodes_h_l582_c23_e544_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l581_c25_0c09_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l578_c31_0717_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_value_d41d_uxn_opcodes_h_l579_c29_217e_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output := device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l567_c7_c85e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_cond;
     result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output := result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l567_c7_c85e_return_output;
     -- result_vram_address_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l564_c7_e541] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output;

     -- Submodule level 10
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l564_c7_e541_return_output;
     -- device_out_result_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l560_c7_6a63] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;

     -- Submodule level 11
     VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l560_c7_6a63_return_output;
     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l557_c7_41cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;

     -- Submodule level 12
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_device_ram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse := VAR_result_vram_value_MUX_uxn_opcodes_h_l557_c7_41cb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_vram_value_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_device_ram_value_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- result_is_device_ram_read_MUX[uxn_opcodes_h_l551_c2_35ed] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_cond;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iftrue;
     result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output := result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3eab_uxn_opcodes_h_l586_l546_DUPLICATE_664c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3eab_uxn_opcodes_h_l586_l546_DUPLICATE_664c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3eab(
     result,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_vram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_opcodes_h_l551_c2_35ed_return_output,
     VAR_result_device_ram_value_MUX_uxn_opcodes_h_l551_c2_35ed_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3eab_uxn_opcodes_h_l586_l546_DUPLICATE_664c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3eab_uxn_opcodes_h_l586_l546_DUPLICATE_664c_return_output;
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
